package migration

import (
	"migration_server/db/models"
	"net/http"

	"github.com/go-pg/pg/v10"
	"github.com/labstack/echo/v4"
)

//GetAllFromProjectFolder checl query param uuid project
func GetAllMigrations(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		migration := &models.Migration{}
		if err := ctx.Bind(migration); err != nil {
			return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		}

		migrations, err := migration.GetAllMigrations(conn)
		if err != nil {
			return ctx.JSON(http.StatusBadRequest,
				struct{ Error string }{err.Error()})
		}
		return ctx.JSON(http.StatusOK, migrations)
	}
}
