package source

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/maxnemoy/inventory_stack/data_parser/data"
	"github.com/maxnemoy/inventory_stack/data_parser/models"
)

func ConfigureTypes(server string)  []models.ItemType {
	var types []models.ItemType;

	json_data, err := json.Marshal(data.TypesInitData)
	if err != nil {
		fmt.Println(err)
	}
	writer("types_send", json_data)

	resp, err := http.Post(server+"/types/import", "application/json", bytes.NewBuffer(json_data))
	if err != nil {
		fmt.Println(err)
	}
	decoder := json.NewDecoder(resp.Body)
	err = decoder.Decode(&types)
    if err != nil {
        panic(err)
    }
	return types
}