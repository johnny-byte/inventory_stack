package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"sort"
	"strconv"
	"strings"

	"github.com/joho/godotenv"
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
	InternalNumber StringInt `json:"internal_number,int"`
	RegNumber      string `json:"reg_number"`
	Type		   DeviceType `json:type`
	Name           string `json:"name"`
	Description    string `json:"description"`
	SerialNumber   StringInt `json:"serial_number"`
	Date           string `json:"date"`
	Count          int `json:"count"`
	Price1         string `json:"price"`
	Price2         string `json:"price__1"`
}

type Data struct {
	Data []Item `json:"data"`
}

type DeviceType struct {
	Id int
	Name string
	Icon string
}

type DeviceTypes struct{
	Types []DeviceType
}

type Place struct {
	ID              int       `json:"id"`
	Name            string    `json:"name"`
}

type PlaceData struct {
	Data []Place `json:"places"`
}

var places = []string{
	"Математика 1",
	"Математика 2",
	"Математика 3",
	"Математика 5",
	"Математика 6",
	"Русский 1",
	"Русский 2",
	"Русский 3",
	"Русский 4",
	"Русский 5",
	"Русский 6",
	"Русский 7",
}



var types = [][]string{
	{"Проектор",},
	{"Экран для проектора", "экран"},
	{"Шторы", "штор", "жалюзи"},
	{"3D принтер", "3 D принтер", "3D-принтер", "3D-сканер",},
	{"МФУ", "Kопировально-можительный", "Многофункциональное устройство", "принтер сканер", "XEROX"},
	{"Принтер",},
	{"Сканер",},
	{"Наборы для робототехники", "Робот", "Ардуино", "Амперка", "Mindstorms", "WeDo", "Микрокомпьютер", "NXT", "TETRIX", "Lego"},
	{"Аудио / Видео", "проигр", "радиосис", "музык", "вокал", "Видео", "Микрофон", "Магнит", "Усилитель", "Микшер", "Экволайзер", "Звук", "Электрогитара", "Приставка", "Колонки", "Сабвуфер"}, //9 аудио видео
	{"Квадрокоптер",},
	{"Мебель", "Мебел", "диван", "отдыха", "Полка", "Стеллаж", "гарнитур", "Стол", "Стул", "Тумба", "Шкаф", "зона", },
	{"Системный блок", "Server", "Систем", "Компьютер", "пк"},
	{"Ноутбук",},
	{"Планшет",},
	{"Монитор",},
	{"Рециркулятор",},
	{"Сейф",},
	{"Телевизор", "ТВ", "Плазма"},
	{"Учебники", "Книг", "Учебн", "Прописи", "Метод", "литерат", "Диск"},
	{"Доска",},
	{"Интерактивная доска", "smart"},
	{"Сетевое оборудование", "сетев", "cеть", "Точка", "роут"},
	{"Мышь"},
	{"Клавиатура"},
	{"Веб-камера"},
	{"Документ-камера"},
	{"Колонтки"},
	{"Наушники"},
	{"Сетевой фильтр"},
}

func configTypes(server string){
	var typesExport DeviceTypes
	for catId, cat := range types{
		typesExport.Types = append(typesExport.Types, DeviceType{catId+1, cat[0], ""})
	}
	typesExport.Types = append(typesExport.Types, DeviceType{-1, "Без категории", ""})
	sort.Slice(typesExport.Types[:], func(i, j int) bool {
		return typesExport.Types[i].Id < typesExport.Types[j].Id
	  })
	   json_data, err := json.Marshal(typesExport)
	   
	   if err != nil {
		   fmt.Println(err)
		   return
		}
		//fmt.Println(string(json_data))

	_, err = http.Post(server + "/types/import", "application/json", bytes.NewBuffer(json_data))

	if err != nil {
		fmt.Println(err)
	}
}

func configPlaces(server string){
	var placeExport PlaceData
	for placeId, place := range places{
		placeExport.Data = append(placeExport.Data, Place{placeId+1, place})
	}
	placeExport.Data = append(placeExport.Data, Place{-1, "Не определено"})
	sort.Slice(placeExport.Data[:], func(i, j int) bool {
		return placeExport.Data[i].ID < placeExport.Data[j].ID
	  })
	json_data, err := json.Marshal(placeExport)
	
	if err != nil {
		fmt.Println(err)
		return
	}
	//fmt.Println(string(json_data))

	_, err = http.Post(server + "/place/import", "application/json", bytes.NewBuffer(json_data))

	if err != nil {
		fmt.Println(err)
	}
}


func configItems(server string){
	jsonFile, err := os.Open("data.json")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("Successfully Opened users.json")
	defer jsonFile.Close()

	var data Data
	//var data2 Data
	
	byteValue, _ := ioutil.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &data)
	fmt.Println(len(data.Data))
	for index, item := range data.Data {
		for catId, cat := range types{
			for _, sub := range cat{
				if strings.Contains(strings.ToLower(item.Name), strings.ToLower(sub)) {
					data.Data[index].Type.Id = catId + 1
					data.Data[index].Type.Name = cat[0]
					break
				} 				
			}
		}
		if data.Data[index].Type.Name == "" {
			data.Data[index].Type.Id = -1
			data.Data[index].Type.Name = "Другое"
		}
	}
	// fmt.Println(data.Data[10].Type)
	// for _, item := range data.Data {
	// 	if(item.Type.Id == -1){
	// 		fmt.Print(item.Type.Name + "---- ")
	// 		fmt.Print(item.Name+ " ")
	// 		fmt.Println(item.InternalNumber)
	// 	}
	// }
	json_data, err := json.Marshal(data)
	
	if err != nil {
        fmt.Println(err)
		return
    }
	err = ioutil.WriteFile("export_items.json", json_data, 0644)
    if err != nil {
        panic(err)
    }

	// var data2 Data
	// json.Unmarshal(json_data, &data2)
	// fmt.Println(data2.Data[2])
	_, err = http.Post(server+"/item/import", "application/json", bytes.NewBuffer(json_data))

	if err != nil {
		fmt.Println(err)
	}
	
}

func main() {
	err := godotenv.Load("./.env")

	if err != nil {
		fmt.Println("Error loading .env file")
	}

	server := os.Getenv("SERVER")
	fmt.Println(server)

	configTypes(server)
	configPlaces(server)
	configItems(server)
}