package places

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v9"
	"github.com/labstack/echo/v4"
)

//GetAllFromProjectFolder checl query param uuid project
func GetAllPlaces(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		place := &models.Place{}
		if err := ctx.Bind(place); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}


		places, err := place.GetAllPlaces(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, places)
	}
}