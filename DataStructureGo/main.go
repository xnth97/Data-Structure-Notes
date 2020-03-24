package main

import (
	"fmt"
)

func testStack() {
	s := MakeStack()
	fmt.Println(s.isEmpty())
	s.push(5)
	s.push(3)
	fmt.Println(s.isEmpty())
	fmt.Println(s.pop())
	fmt.Println(s)
}

func testLinkedList() {
	l := MakeLinkedList()
	l.addFirst(5)
	l.addLast(10)
	l.addLast(15)
	l.print()
	l.addFirst(3)
	l.insertAfter(10, 13)
	l.insertBefore(15, 14)
	l.remove(5)
	l.print()
}

func testQueue() {
	q := MakeQueue()
	q.enqueue(5)
	q.enqueue(10)
	fmt.Println(q.dequeue())
	q.enqueue(15)
	fmt.Println(q)
	fmt.Println(q.peekFront())
}

func testHashTable() {
	t := MakeHashTable(5)
	t.insert(3)
	t.insert(4)
	fmt.Println(t.search(3))
	t.insert(8)
	fmt.Println(t)
	t.delete(3)
	fmt.Println(t.search(3))
}

func main() {
	// testLinkedList()
	// testQueue()
	testHashTable()
}
