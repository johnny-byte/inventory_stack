package items

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//FindLikeUUID checl query param uuid project
func FindLikeUUID(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Item{}
		item.UUID = ctx.Param("uuid")

		items, err := item.FindLikeUUID(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, items)
	}
}
