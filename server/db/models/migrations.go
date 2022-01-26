package models

import (
	"time"

	"github.com/go-pg/pg/v10"
)

type Migration struct {
	UUID         string    `pg:"uuid,unique,pk" json:"uuid"`
	CreateAt     time.Time `pg:"create_at" json:"create_at"`
	UpgradeAt    time.Time `pg:"upgrade_at" json:"upgrade_at"`
	DeleteAt     time.Time `pg:"delete_at" json:"delete_at"`
	ReturnedDate time.Time `pg:"returned_date" json:"returned_date"`
	ItemUUID     string    `pg:"item_uuid" json:"item_uuid"`
	FromUUID     string    `pg:"from_uuid" json:"from_uuid"`
	ToUUID       string    `pg:"to_uuid" json:"to_uuid"`
	Item         *Item     `pg:"rel:has-one" json:"item"`
	From         *Place    `pg:"rel:has-one" json:"from"`
	To           *Place    `pg:"rel:has-one" json:"to"`
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
	for i, item := range *migrations {
		fromPlace := &Place{}
		toPlace := &Place{}
		itm := &Item{}
		itmType := &ItemType{}
		conn.Model(itm).Where("uuid = ?0", item.ItemUUID).Select()
		conn.Model(itmType).Where("uuid = ?0", itm.TypeUUID).Select()
		conn.Model(fromPlace).Where("uuid = ?0", item.FromUUID).Select()
		conn.Model(toPlace).Where("uuid = ?0", item.ToUUID).Select()
		(*migrations)[i].Item = itm
		(*migrations)[i].Item.Type = itmType
		(*migrations)[i].From = fromPlace
		(*migrations)[i].To = toPlace
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
