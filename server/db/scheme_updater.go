package db

import (
	"migration_server/db/models"

	"github.com/go-pg/pg/v10"
	"github.com/go-pg/pg/v10/orm"
)

func createSchema(db *pg.DB) error {
	for _, model := range []interface{}{
		(*models.ItemType)(nil),
		(*models.Migration)(nil),
		(*models.Item)(nil),
		(*models.Place)(nil),
	} {
		err := db.Model(model).CreateTable(&orm.CreateTableOptions{IfNotExists: true})
		if err != nil {
			return err
		}
	}
	return nil
}
