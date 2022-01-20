package items

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v9"
	"github.com/labstack/echo/v4"
)

//FindLikeInternalNumber checl query param uuid project
func FindLikeInternalNumber(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Item{}
		item.InternalNumber = ctx.Param("internal_number")


		items, err := item.FindLikeInternalNumber(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, items)
	}
}