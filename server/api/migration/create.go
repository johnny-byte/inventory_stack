package migration

import (
	"migration_server/db/models"
	"net/http"
	"time"

	"github.com/go-pg/pg/v9"
	"github.com/labstack/echo/v4"
	uuid "github.com/satori/go.uuid"
)

//Create fun
func Create(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Migration{}
		if err := ctx.Bind(item); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		item.CreateAt = time.Now()
		item.UpgradeAt = time.Now()
		var err error
		item.UUID = uuid.Must(uuid.NewV4(), err).String()
		if err != nil{
			return err
		}
		if err := item.CreateMigration(conn); err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}

		imt := &models.Item{}
		imt.UUID = item.Item.UUID
		imt.CurrentPlace = item.To
		imt.UpdateCurrentPlace(conn)
		
		return ctx.JSON(http.StatusCreated, item)
	}
}