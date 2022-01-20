package db

import (
	"migration_server/db/models"

	"github.com/go-pg/pg/v9"
	"github.com/go-pg/pg/v9/orm"
)

func createSchema(db *pg.DB) error {
	for _, model := range []interface{}{
		(*models.ItemType)(nil),
		(*models.Migration)(nil),
		(*models.Item)(nil),
		(*models.Place)(nil),
	} {
		err := db.CreateTable(model, &orm.CreateTableOptions{IfNotExists: true})
		if err != nil {
			return err
		}
	}
	return nil
}