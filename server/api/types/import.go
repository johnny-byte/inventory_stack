package types

import (
	"migration_server/db/models"
	"net/http"
	"time"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
	uuid "github.com/satori/go.uuid"
)

//Create fun
func Import(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		items := &[]models.ItemType{}
		if err := ctx.Bind(items); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		for _, item := range *items {
			item.CreateAt = time.Now()
			item.UpgradeAt = time.Now()
			var err error
			item.UUID = uuid.Must(uuid.NewV4(), err).String()
			if err != nil {
				return err
			}
			if err := item.CreateItem(conn); err != nil {
				return ctx.JSON(http.StatusBadRequest,
					struct{ Error string }{err.Error()})
			}
		}

		item := models.ItemType{}
		itemsResp, _ :=item.GetAllItems(conn)
		
		return ctx.JSON(http.StatusCreated, itemsResp)
	}
}
