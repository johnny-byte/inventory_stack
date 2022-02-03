package source

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"os/exec"
	"strings"

	"github.com/maxnemoy/inventory_stack/data_parser/data"
	"github.com/maxnemoy/inventory_stack/data_parser/models"
)

func getUUID(name string, types []models.ItemType) string {
	for _, item := range types {
		if item.Name == name {
			return item.UUID
		}
	}
	return ""
}

func ConfigItems(server string, types []models.ItemType) {
	// run python script
	_, err := exec.Command("pip", "install", "pydantic").Output()
	if err != nil {
		fmt.Println(err)
		return
	} else {
		fmt.Println("Started: pip install pydantic")
	}

	_, err = exec.Command("python", "-m", "python_parser").Output()
	if err != nil {
		fmt.Println(err)
		return
	} else {
		fmt.Println("Started: python -m python_parser")
	}

	jsonFile, err := os.Open("./data.json")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("Successfully Opened data.json")
	defer jsonFile.Close()

	var items []models.Item

	byteValue, _ := ioutil.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &items)

	for index, item := range items {
		for _, cat := range data.TypesInitData {
			for _, key := range cat.Keys {
				if strings.Contains(strings.ToLower(item.Name), strings.ToLower(key)) {
					items[index].TypeUUID = getUUID(cat.Name, types)
					break
				}
			}
		}
	}

	json_data, err := json.Marshal(items)
	writer("items_send", json_data)

	_, err = http.Post(server+"/item/import", "application/json", bytes.NewBuffer(json_data))

	if err != nil {
		fmt.Println(err)
	}
}
