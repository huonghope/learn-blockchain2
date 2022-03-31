package main

import "fmt"

func main() {

	number := 10

	// if loop
	if number == 10 {
		fmt.Println("number = 10")
	}

	if number < 10 {
		fmt.Println("number < 10")
	} else {
		fmt.Println("number > 10")
	}

	if a := 100; a > 100 {
		fmt.Println("a > 100")
	} else {
		fmt.Println("a = 100")
	}

	numberTest := 10
	switch numberTest {
	case 1: // case 1, 200m 200, number > 10, number = 10
		fmt.Println("number = 1")
		break
	}

	// fallthrough:chay nhung case ben duoi luon
	switch numberTest {
	case 1: // case 1, 200m 200, number > 10, number
		fmt.Println("number = 1")
		fallthrough
	case 2:
		fmt.Println("number = 2")
	}
}
