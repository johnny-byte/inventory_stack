package models

type PlaceData struct {
	Data []Place `json:"places"`
}

type Data struct {
	Data []Item `json:"data"`
}



type ItemTypes struct{
	Types []ItemType
}