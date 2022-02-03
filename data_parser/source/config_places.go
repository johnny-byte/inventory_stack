package source

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/maxnemoy/inventory_stack/data_parser/data"
	"github.com/maxnemoy/inventory_stack/data_parser/models"
)

func ConfigurePlaces(server string) []models.Place{
	var places []models.Place;
	json_data, err := json.Marshal(data.PlacesInitData)
	if err != nil {
		fmt.Println(err)
	}
	writer("place_send", json_data)

	resp, err := http.Post(server+"/place/import", "application/json", bytes.NewBuffer(json_data))
	if err != nil {
		fmt.Println(err)
	}

	decoder := json.NewDecoder(resp.Body)
	err = decoder.Decode(&places)
    if err != nil {
        panic(err)
    }
	return places
}