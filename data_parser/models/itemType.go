package models

type ItemType struct {
	UUID        string `json:"uuid"`
	Name        string `json:"name"`
	Icon        string `json:"icon"`
	Description string `json:"description"`
	Keys        []string
}
