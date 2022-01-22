package types

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//GetAllFromProjectFolder checl query param uuid project
func GetAll(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		place := &models.ItemType{}
		if err := ctx.Bind(place); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		places, err := place.GetAllItems(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, places)
	}
}
