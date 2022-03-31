package main

import "fmt"

// main function
func main() {

	// print function
	fmt.Printf("Hello")
	fmt.Println(Sum(3))

	// value
	var number int
	number = 1000
	fmt.Println((number))

	// Type Infence auto complier to string
	var email = "test@gmail.com"
	fmt.Printf(email)

	// 1. init multi value with same type
	// var a,b int  = 10, 11
	// var a,b = 12,13
	var a, b int
	a = 1
	b = 2
	fmt.Println(a)
	fmt.Println(b)

	// 2. init multi value with diffent type
	var (
		name    string
		address string
		age     int
	)

	name = "Robin"
	address = "Korea"
	age = 25

	fmt.Println(name)
	fmt.Println(address)
	fmt.Println(age)

	var name2, address2, age2 = "name2", "address2", 12

	fmt.Println(name2)
	fmt.Println(address2)
	fmt.Println(age2)

	language := "Golang"
	fmt.Println(language)
}

func Sum(number int) int {
	sum := 0
	for i := 0; i < number; i++ {
		sum += i
	}
	return sum
}
