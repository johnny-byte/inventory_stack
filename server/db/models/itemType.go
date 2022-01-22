package models

import (
	"time"

	"github.com/go-pg/pg/v10"
)

type ItemType struct {
	CreateAt    time.Time `pg:"create_at" json:"create_at"`
	UpgradeAt   time.Time `pg:"upgrade_at" json:"upgrade_at"`
	DeleteAt    time.Time `pg:"delete_at" json:"delete_at"`
	UUID        string    `pg:"uuid,unique,pk" json:"uuid"`
	Name        string    `pg:"name" json:"name" validate:"required"`
	Icon        string    `pg:"icon" json:"icon" validate:"required"`
	Description string    `pg:"description" json:"description"`
}

func (itm *ItemType) CreateItem(conn *pg.DB) error {
	if _, err := conn.Model(itm).Insert(itm); err != nil {
		return err
	}
	return nil
}

func (itm *ItemType) GetAllItems(conn *pg.DB) (*[]ItemType, error) {
	items := &[]ItemType{}
	if err := conn.Model(items).
		Select(); err != nil {
		return nil, err
	}
	return items, nil
}
