package models

import (
	"strings"
	"time"

	"github.com/go-pg/pg/v10"
)

type Item struct {
	UUID             string       `pg:"uuid,unique,pk" json:"uuid"`
	CreateAt         time.Time    `pg:"create_at" json:"create_at"`
	UpgradeAt        time.Time    `pg:"upgrade_at" json:"upgrade_at"`
	DeleteAt         time.Time    `pg:"delete_at" json:"delete_at"`
	SerialNumber     string       `pg:"serial_number" json:"serial_number"`
	RegNumber        string       `pg:"reg_number" json:"reg_number"`
	InternalNumber   string       `pg:"internal_number,unique" json:"internal_number"`
	Name             string       `pg:"name" json:"name" validate:"required"`
	Description      string       `pg:"description" json:"description"`
	TypeUUID         string       `pg:"type_uuid" json:"type_uuid"`
	Type             *ItemType    `pg:"rel:has-one" json:"type"`
	Date             string       `pg:"date" json:"date"`
	Count            int          `pg:"count" json:"count"`
	RootPlaceUUID    string       `pg:"root_place_uuid" json:"root_place_uuid"`
	CurrentPlaceUUID string       `pg:"current_place_uuid" json:"current_place_uuid"`
	RootPlace        *Place       `pg:"rel:has-one" json:"root_place"`
	CurrentPlace     *Place       `pg:"rel:has-one" json:"current_place"`
	Migrations       *[]Migration `pg:"rel:has-many" json:"migrations"`
}

func (itm *Item) CreateItem(conn *pg.DB) error {
	if _, err := conn.Model(itm).Insert(itm); err != nil {
		return err
	}
	return nil
}

func (itm *Item) GetAllItems(conn *pg.DB) (*[]Item, error) {
	items := &[]Item{}
	if err := conn.Model(items).
		Select(); err != nil {
		return nil, err
	}
	for i, item := range *items {
		placeRoot := &Place{}
		placeCurrent := &Place{}
		itemType := &ItemType{}
		migrations := &[]Migration{}
		conn.Model(itemType).Where("uuid = ?0", item.TypeUUID).Select()
		conn.Model(placeRoot).Where("uuid = ?0", item.RootPlaceUUID).Select()
		conn.Model(placeCurrent).Where("uuid = ?0", item.RootPlaceUUID).Select()
		conn.Model(placeCurrent).Where("uuid = ?0", item.RootPlaceUUID).Select()
		conn.Model(migrations).Where("item_uuid = ?0", item.UUID).Select()
		(*items)[i].Type = itemType
		(*items)[i].RootPlace = placeRoot
		(*items)[i].CurrentPlace = placeCurrent
		for index, mirate := range *migrations{
			from := &Place{}
			to := &Place{}
			conn.Model(from).Where("uuid = ?0", mirate.FromUUID).Select()
			conn.Model(to).Where("uuid = ?0", mirate.ToUUID).Select()
			(*migrations)[index].From = from
			(*migrations)[index].To = to
		}
		(*items)[i].Migrations = migrations
	}
	return items, nil
}

func (itm *Item) GetAllItemsByRootPlace(conn *pg.DB) (*[]Item, error) {
	items := &[]Item{}
	if err := conn.Model(items).
		Where("root_place = ?0", itm.RootPlace).
		Select(); err != nil {
		return nil, err
	}
	return items, nil
}

func (itm *Item) GetAllItemsByCurrentPlace(conn *pg.DB) (*[]Item, error) {
	items := &[]Item{}
	if err := conn.Model(items).
		Where("current_place = ?0", itm.CurrentPlace).
		Select(); err != nil {
		return nil, err
	}
	return items, nil
}

func (itm *Item) UpdateRootPlace(conn *pg.DB) error {
	itm.UpgradeAt = time.Now()
	_, err := conn.Model(itm).
		Set("root_place = ?0", itm.RootPlace).
		Where("uuid = ?0", itm.UUID).
		Update()
	if err != nil {
		return err
	}
	return nil
}

func (itm *Item) UpdateCurrentPlace(conn *pg.DB) error {
	itm.UpgradeAt = time.Now()
	_, err := conn.Model(itm).
		Set("current_place_uuid = ?0", itm.CurrentPlaceUUID).
		Where("uuid = ?0", itm.UUID).
		Update()
	if err != nil {
		return err
	}
	return nil
}

func (itm *Item) FindLikeSerialNumber(conn *pg.DB) (*[]Item, error) {
	product := &[]Item{}

	_, err := conn.Query(product,
		"SELECT * FROM items WHERE LOWER(serial_number) LIKE '%"+strings.ToLower(itm.SerialNumber)+"%';")
	if err != nil {
		return nil, err
	}

	return product, nil
}
func (itm *Item) FindLikeInternalNumber(conn *pg.DB) (*[]Item, error) {
	product := &[]Item{}

	_, err := conn.Query(product,
		"SELECT * FROM items WHERE LOWER(internal_number) LIKE '%"+strings.ToLower(itm.InternalNumber)+"%';")
	if err != nil {
		return nil, err
	}

	return product, nil
}

func (itm *Item) FindLikeUUID(conn *pg.DB) (*[]Item, error) {
	product := &[]Item{}

	_, err := conn.Query(product,
		"SELECT * FROM items WHERE LOWER(uuid) LIKE '%"+strings.ToLower(itm.UUID)+"%';")
	if err != nil {
		return nil, err
	}

	return product, nil
}

func (itm *Item) Update(conn *pg.DB) error {
	itm.UpgradeAt = time.Now()
	_, err := conn.Model(itm).
		Set("internal_number = ?internal_number").
		Set("serial_number = ?serial_number").
		Set("name = ?name").
		Set("description = ?description").
		Set("type = ?0", itm.Type).
		Set("root_place = ?root_place").
		Set("upgrade_at = ?upgrade_at").
		Where("uuid = ?0", itm.UUID).
		Update()
	if err != nil {
		return err
	}
	return nil
}
