  
package db

import (
	"github.com/go-pg/pg/v9"
	"log"
	"os"
)

//Connect to database
func Connect() *pg.DB {
	var opts *pg.Options
	var err error

	if os.Getenv("DATABASE_URL") != "" {
		opts, err = pg.ParseURL(os.Getenv("DATABASE_URL"))
		if err != nil {
			panic(err)
		}
	} else {
		opts = &pg.Options{
			User:     os.Getenv("DB_USER"),
			Password: os.Getenv("DB_PASSWORD"),
			Addr:     os.Getenv("DB_ADDRESS"),
			Database: os.Getenv("DB_NAME"),
		}
	}

	var db = pg.Connect(opts)
	if db == nil {
		log.Printf("DB connection filed\n")
		//os.Exit(100)
	}
	err = createSchema(db)
	if err != nil {
		log.Printf("DB error %v", err)
		os.Exit(100)
	}
	return db
}