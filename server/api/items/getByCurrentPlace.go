package items

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//GetFromCurretPlace func
func GetFromCurretPlace(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		Item := &models.Item{}

		Item.CurrentPlace.UUID = ctx.Param("place_uuid")
		places, err := Item.GetAllItemsByCurrentPlace(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}

		return ctx.JSON(http.StatusOK, places)
	}
}
