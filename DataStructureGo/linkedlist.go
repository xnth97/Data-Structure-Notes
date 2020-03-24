package main

import "fmt"

type ListNode struct {
	value interface{}
	next  *ListNode
}

type LinkedList struct {
	head *ListNode
}

func MakeLinkedList() LinkedList {
	return LinkedList{nil}
}

func (list *LinkedList) print() {
	tmp := list.head
	for tmp != nil {
		fmt.Printf("%d, ", tmp.value)
		tmp = tmp.next
	}
	fmt.Print("\n")
}

func (list *LinkedList) addFirst(item interface{}) {
	tmp := list.head
	node := ListNode{item, tmp}
	list.head = &node
}

func (list *LinkedList) addLast(item interface{}) {
	if list.head == nil {
		list.addFirst(item)
		return
	}

	tmp := list.head
	for tmp.next != nil {
		tmp = tmp.next
	}
	tmp.next = &ListNode{item, nil}
}

func (list *LinkedList) insertAfter(key interface{}, item interface{}) {
	tmp := list.head
	for tmp != nil && tmp.value != key {
		tmp = tmp.next
	}
	tmp.next = &ListNode{item, tmp.next}
}

func (list *LinkedList) insertBefore(key interface{}, item interface{}) {
	if list.head == nil {
		return
	}
	if list.head.value == key {
		list.addFirst(item)
		return
	}
	var prev *ListNode
	curr := list.head
	for curr != nil && curr.value != key {
		prev = curr
		curr = curr.next
	}
	if curr != nil {
		prev.next = &ListNode{item, curr}
	}
}

func (list *LinkedList) remove(key interface{}) {
	if list.head == nil {
		return
	}
	if list.head.value == key {
		list.head = list.head.next
		return
	}
	var prev *ListNode
	curr := list.head
	for curr != nil && curr.value != key {
		prev = curr
		curr = curr.next
	}
	if curr != nil {
		prev.next = curr.next
	}
}
