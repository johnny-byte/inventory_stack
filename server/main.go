package main

import (
	"flag"

	"log"
	"migration_server/api/types"
	"migration_server/api/items"
	"migration_server/api/migration"
	"migration_server/api/places"
	"migration_server/db"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	port := os.Getenv("PORT")

	if port == "" {
		port = *flag.String("port", "6001", "server port")
	}

	err := godotenv.Load("./.env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	flag.Parse()
	conn := db.Connect()
	apiPublic := echo.New()

	apiPublic.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowMethods: []string{http.MethodGet, http.MethodPut, http.MethodPost, http.MethodDelete},
	}))

	apiPublic.Use(middleware.Logger())
	apiPublic.Use(middleware.Recover())

	// Routes
	apiPublic.GET("/", hello)

	
	apiPublic.POST("/place/create", places.Create(conn))
	apiPublic.POST("/place/import", places.Import(conn))
	apiPublic.POST("/place/update", places.Update(conn))
	apiPublic.GET("/place/all", places.GetAllPlaces(conn))
	apiPublic.GET("/place/name/:name/find", places.FindLikeName(conn))
	
	apiPublic.POST("/types/import", types.Import(conn))
	apiPublic.GET("/types/all", types.GetAll(conn))

	apiPublic.POST("/item/create", items.Create(conn))
	apiPublic.POST("/item/import", items.Import(conn))
	apiPublic.POST("/item/update", items.Update(conn))
	apiPublic.GET("/item/all", items.GetAllItems(conn))
	apiPublic.GET("/item/current/:place_uuid/all", items.GetFromCurretPlace(conn))
	apiPublic.GET("/item/serial/:serial_number/find", items.FindLikeSerialNumber(conn))
	apiPublic.GET("/item/internal/:internal_number/find", items.FindLikeInternalNumber(conn))
	apiPublic.GET("/item/uuid/:uuid/find", items.FindLikeUUID(conn))
	
	apiPublic.POST("/migration/create", migration.Create(conn))
	apiPublic.GET("/migration/all", migration.GetAllMigrations(conn))



	// Start server
	apiPublic.Logger.Fatal(apiPublic.Start(":" + port))
}

// Handler
func hello(c echo.Context) error {
	return c.String(http.StatusOK, "inventory stack backend")
}