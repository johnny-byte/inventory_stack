package models

import (
	"time"

	"github.com/go-pg/pg/v10"
)

type Migration struct {
	ID           int       `pg:"id,pk" json:"id"`
	CreateAt     time.Time `pg:"create_at" json:"create_at"`
	UpgradeAt    time.Time `pg:"upgrade_at" json:"upgrade_at"`
	DeleteAt     time.Time `pg:"delete_at" json:"delete_at"`
	ReturnedDate time.Time `pg:"returned_date" json:"returned_date"`
	UUID         string    `pg:"uuid,unique" json:"uuid"`
	Item         Item      `pg:"item,join_fk:id" json:"item"`
	From         Place     `pg:"from,join_fk:id" json:"from"`
	To           Place     `pg:"to,join_fk:id" json:"to"`
}

func (itm *Migration) CreateMigration(conn *pg.DB) error {
	if _, err := conn.Model(itm).Insert(itm); err != nil {
		return err
	}
	return nil
}

func (itm *Migration) GetAllMigrations(conn *pg.DB) (*[]Migration, error) {
	migrations := &[]Migration{}
	if err := conn.Model(migrations).
		Select(); err != nil {
		return nil, err
	}
	return migrations, nil
}

func (itm *Migration) GetAllMigrationsFromDevice(conn *pg.DB) (*[]Migration, error) {
	migrations := &[]Migration{}
	if err := conn.Model(migrations).
		Where("device_uuid.uuid = ?0", itm.UUID).
		Select(); err != nil {
		return nil, err
	}
	return migrations, nil
}
