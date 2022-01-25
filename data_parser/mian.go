package main

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
	"github.com/maxnemoy/inventory_stack/data_parser/source"
)

func main() {
	err := godotenv.Load("./.env")

	if err != nil {
		fmt.Println("Error loading .env file")
	}

	server := os.Getenv("SERVER")
	fmt.Println(server)

	var types = source.ConfigureTypes(server)
	source.ConfigurePlaces(server)

	source.ConfigItems(server, types)
	//fmt.Println(types)
	//fmt.Println(places)
}