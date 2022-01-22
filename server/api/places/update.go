package places

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//Update fun
func Update(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Place{}
		if err := ctx.Bind(item); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		if err := item.Update(conn); err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}

		return ctx.JSON(http.StatusCreated, item)
	}
}
