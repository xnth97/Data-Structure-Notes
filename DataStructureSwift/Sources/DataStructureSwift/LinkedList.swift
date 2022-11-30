//
//  LinkedList.swift
//  
//
//  Created by Yubo Qin on 11/29/22.
//

import Foundation

class LinkedList<T: Equatable> {

    class Node<T> {
        var data: T
        var next: Node<T>?

        init(data: T, next: Node<T>? = nil) {
            self.data = data
            self.next = next
        }
    }

    private(set) var head: Node<T>?

    init() {
        self.head = nil
    }

    func addFirst(item: T) {
        let newHead = Node(data: item, next: head)
        head = newHead
    }

    func addLast(item: T) {
        guard let head else {
            addFirst(item: item)
            return
        }

        var tmp = head
        while let next = tmp.next {
            tmp = next
        }
        tmp.next = Node(data: item)
    }

    func insert(after key: T, item: T) {
        var tmp = head
        while tmp != nil, tmp?.data != key {
            tmp = tmp?.next
        }
        tmp?.next = Node(data: item, next: tmp?.next)
    }

    func insert(before key: T, item: T) {
        guard let head else {
            return
        }

        if head.data == key {
            addFirst(item: item)
            return
        }

        var prev: Node<T>?
        var curr: Node<T>? = head

        while curr != nil, curr?.data != key {
            prev = curr
            curr = curr?.next
        }

        if let curr {
            prev?.next = Node(data: item, next: curr)
        }
    }

    func remove(item: T) {
        guard let head else {
            return
        }

        if head.data == item {
            self.head = head.next
            return
        }

        var prev: Node<T>?
        var curr: Node<T>? = head

        while curr != nil, curr?.data != item {
            prev = curr
            curr = curr?.next
        }

        if let curr {
            prev?.next = curr.next
        }
    }

}

extension LinkedList: CustomStringConvertible {

    var description: String {
        var desc = "["
        var tmp = head
        while tmp != nil {
            desc.append("\(tmp!.data), ")
            tmp = tmp?.next
        }
        desc.append("]")
        return desc
    }

}

