package main

import "fmt"

func main() {
	input := "(add 2 (subtract (add 3 5) 1))\n(test \"abc\" 1)"
	output := Compiler(input)
	fmt.Println(output)
}
