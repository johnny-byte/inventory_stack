package items

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v9"
	"github.com/labstack/echo/v4"
)

//FindLikeSerialNumber checl query param uuid project
func FindLikeSerialNumber(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Item{}
		item.SerialNumber = ctx.Param("serial_number")

		items, err := item.FindLikeSerialNumber(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, items)
	}
}
