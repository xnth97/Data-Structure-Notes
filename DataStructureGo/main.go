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
	t.print()
	t.delete(3)
	fmt.Println(t.search(3))
}

func testBST() {
	t := MakeBinarySearchTree()
	t.insert(10, 10)
	t.insert(5, 5)
	t.insert(11, 11)
	t.insert(7, 7)
	t.insert(6, 6)
	fmt.Println(DFSTraverse(&t))
	fmt.Println(BFSTraverse(&t))
}

func testSorting() {
	d := []int{6, 4, 1, 3, 8, 5}
	// BubbleSort(&d)
	// SelectionSort(&d)
	// InsertionSort(&d)
	// d = MergeSort(d)
	d = QuickSort(d)
	fmt.Println(d)
}

func main() {
	// testLinkedList()
	// testQueue()
	// testHashTable()
	// testBST()
	testSorting()
}
