package main

import (
	"fmt"
	"math"
	"math/bits"
)

func main() {
	//bool
	var myBool bool = true // true or false
	fmt.Println(myBool)

	// String
	var myString string = "hello"
	fmt.Printf(myString)

	// int
	var myInt int = 123
	fmt.Println(myInt)

	// int 8, 16,32, 64
	// range
	fmt.Println(math.MinInt8)
	fmt.Println(math.MaxInt8)

	// 2 Bits
	fmt.Println(bits.OnesCount16(math.MaxUint16))

	// uint: nguyen duong
	var myByte byte = 1
	fmt.Printf("%T", myByte)

	// float32 64
	var myFloat float64 = 10.01
	fmt.Println(myFloat)

	// complex : so phuc
}
