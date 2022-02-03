package source

import (
	"fmt"
	"io/ioutil"
	"os"
)

func writer(name string, data []byte) {
	jsonFile, err := os.Open(name + ".json")
	if err != nil {
		fmt.Println(err)
	}
	defer jsonFile.Close()

	err = ioutil.WriteFile(name + ".json", data, 0644)
    if err != nil {
        panic(err)
    }

}