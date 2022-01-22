package items

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//GetAllFromProjectFolder checl query param uuid project
func GetAllItems(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Item{}
		if err := ctx.Bind(item); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		items, err := item.GetAllItems(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, items)
	}
}
