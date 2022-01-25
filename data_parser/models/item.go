package models

import (
	"encoding/json"
	"strconv"
)

type StringInt string

func (cf *StringInt) UnmarshalJSON(b []byte) error {
	var item interface{}
    if err := json.Unmarshal(b, &item); err != nil {
        return err
    }
    switch v := item.(type) {
    case int:
        *cf = StringInt(strconv.Itoa(v))
    case float64:
        *cf = StringInt(strconv.Itoa(int(v)))
    case string:
        *cf = StringInt(v)

    }
	return nil
}

type Item struct {
	Id             int `json:"id"`
	UUID           string `json:"uuid"`
	InternalNumber StringInt `json:"internal_number,int"`
	RegNumber      string `json:"reg_number"`
	TypeUUID	   string `json:"type_uuid"`
	Type		   ItemType `json:"type"`
	Name           string `json:"name"`
	Description    string `json:"description"`
	SerialNumber   StringInt `json:"serial_number"`
	Date           string `json:"date"`
	Count          int `json:"count"`
}