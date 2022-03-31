package main

import "fmt"

func main() {
	// Rune
	var myString string = "Hưởng"

	fmt.Println(myString)

	// data type runes
	runes := []rune(myString)

	for i := 0; i < len(runes); i++ {
		fmt.Printf("%c", runes[i])
	}
}
