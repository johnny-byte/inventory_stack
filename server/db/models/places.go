package models

import (
	"strings"
	"time"

	"github.com/go-pg/pg/v10"
)

type Place struct {
	UUID        string    `pg:"uuid,unique,pk" json:"uuid"`
	CreateAt    time.Time `pg:"create_at" json:"create_at"`
	UpgradeAt   time.Time `pg:"upgrade_at" json:"upgrade_at"`
	DeleteAt    time.Time `pg:"delete_at" json:"delete_at"`
	Name        string    `pg:"name" json:"name"`
	Description string    `pg:"description" json:"description"`
	ItemsUUID   []string  `pg:"items_uuid" json:"items_uuid"`
	Items       []Item   `pg:"rel:has-many" json:"items"`
}

func (itm *Place) CreatePlace(conn *pg.DB) error {
	if _, err := conn.Model(itm).Insert(itm); err != nil {
		return err
	}
	return nil
}

func (itm *Place) GetDefault(conn *pg.DB) (*Place, error) {
	place := &Place{}
	if err := conn.Model(place).Where("name = ?", "Не определено").Select(); err != nil {
		return nil, err
	}
	return place, nil
}

func (itm *Place) GetAllPlaces(conn *pg.DB) (*[]Place, error) {
	places := &[]Place{}
	if err := conn.Model(places).
		Select(); err != nil {
		return nil, err
	}
	return places, nil
}

func (itm *Place) FindLikeName(conn *pg.DB) (*[]Place, error) {
	place := &[]Place{}

	_, err := conn.Query(place,
		"SELECT * FROM places WHERE LOWER(name) LIKE '%"+strings.ToLower(itm.Name)+"%';")
	if err != nil {
		return nil, err
	}

	return place, nil
}

func (pls *Place) Update(conn *pg.DB) error {
	pls.UpgradeAt = time.Now()
	_, err := conn.Model(pls).
		Set("name = ?name").
		Set("description = ?description").
		Set("upgrade_at = ?upgrade_at").
		Where("uuid = ?0", pls.UUID).
		Update()
	if err != nil {
		return err
	}
	return nil
}
