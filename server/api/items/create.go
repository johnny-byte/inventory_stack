package items

import (
	"migration_server/db/models"
	"net/http"
	// "time"

	"github.com/go-pg/pg/v10"
	// "github.com/gookit/validate"
	"github.com/labstack/echo/v4"
	// uuid "github.com/satori/go.uuid"
)

//Create fun
func Create(conn *pg.DB) func(ctx echo.Context) error {
	return func(ctx echo.Context) error {
		item := &models.Item{}
		// defaultPlace := &models.Place{}
		// defaultPlace, _ = defaultPlace.GetDefault(conn)
		// fmt.Println(defaultPlace)

		// if err := ctx.Bind(item); err != nil {
		// 	return ctx.JSON(http.StatusBadRequest, struct{ Error string }{err.Error()})
		// }

		// v := validate.Struct(item)
		// if v.Validate() {
		// 	item.CreateAt = time.Now()
		// 	item.UpgradeAt = time.Now()
		// 	//item.RootPlaceUUID = defaultPlace.UUID
		// 	var err error
		// 	item.UUID = uuid.Must(uuid.NewV4(), err).String()
		// 	if err != nil {
		// 		return err
		// 	}
		// 	// if err := item.CreateItem(conn); err != nil {
		// 	// 	return ctx.JSON(http.StatusBadRequest,
		// 	// 		struct{ Error string }{err.Error()})
		// 	// }
		// } else {
		// 	return ctx.JSON(http.StatusBadRequest, v.Errors.All())
		// }

		return ctx.JSON(http.StatusCreated, item)
	}
}
