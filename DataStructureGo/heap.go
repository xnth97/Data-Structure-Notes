package main

import "fmt"

type HeapNode struct {
	key int
}

func MakeHeapNode(key int) HeapNode {
	return HeapNode{key}
}

type MaxHeap struct {
	array []*HeapNode
}

func MakeMaxHeap() MaxHeap {
	return MaxHeap{make([]*HeapNode, 0)}
}

func (heap *MaxHeap) print() {
	for _, val := range heap.array {
		fmt.Printf("%d, ", val.key)
	}
	fmt.Println()
}

func (heap *MaxHeap) insert(key int) {
	node := HeapNode{key}
	heap.array = append(heap.array, &node)
	heap.percolateUp(len(heap.array) - 1)
}

func (heap *MaxHeap) percolateUp(index int) {
	// save the bottom node
	bottom := heap.array[len(heap.array)-1]
	// find the initial index value of parent
	parent := (index - 1) / 2
	// while parent's key is smaller than the new key
	for index > 0 && heap.array[parent].key < bottom.key {
		// parent node comes down
		heap.array[index] = heap.array[parent]
		// index moves up
		index = parent
		parent = (parent - 1) / 2
	}
	// finally, insert newly added node into proper position
	heap.array[index] = bottom
}

func (heap *MaxHeap) removeMax() int {
	if heap.array == nil || len(heap.array) == 0 {
		return -1
	}
	root := heap.array[0]
	heap.array[0] = heap.array[len(heap.array)-1]
	heap.array = heap.array[:len(heap.array)-1]
	if len(heap.array) > 0 {
		heap.perculateDown(0)
	}
	return root.key
}

func (heap *MaxHeap) perculateDown(index int) {
	top := heap.array[index]
	largerChild := -1
	for index < len(heap.array)/2 {
		leftChild := index*2 + 1
		rightChild := (index + 1) * 2
		// find which one is larger
		if rightChild < len(heap.array) && heap.array[leftChild].key < heap.array[rightChild].key {
			largerChild = rightChild
		} else {
			largerChild = leftChild
		}
		// no need to go down any more
		if heap.array[largerChild].key <= top.key {
			break
		}
		// move the nodes up
		heap.array[index] = heap.array[largerChild]
		// index goes down toward larger child
		index = largerChild
	}
	// put top key into proper location to restore the heap
	heap.array[index] = top
}

func heapSort(data []int) []int {
	heap := MakeMaxHeap()
	for _, val := range data {
		heap.insert(val)
	}
	ret := make([]int, 0)
	for i := 0; i < len(data); i++ {
		ret = append(ret, heap.removeMax())
	}
	return ret
}
