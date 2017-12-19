//
//  SinglyLinkedList.swift
//  DataStructureSwift
//
//  Created by Yubo Qin on 2017/12/19.
//  Copyright © 2017年 Yubo Qin. All rights reserved.
//

import Foundation

class SinglyLinkedList<T: Equatable> {
    
    fileprivate var head: Node<T>?
    
    init() {
        head = nil
    }
    
    func addFirst(_ item: T) {
        head = Node(data: item, next: nil)
    }
    
    func addLast(_ item: T) {
        // empty
        if head == nil {
            addFirst(item)
            return
        }
        // traverse to find last element
        var tmp = self.head!
        while tmp.next != nil {
            tmp = tmp.next!
        }
        tmp.next = Node(data: item, next: nil)
    }
    
    func insertAfter(_ key: T, item: T) {
        var tmp = head
        while tmp != nil && tmp!.data != item {
            tmp = tmp!.next
        }
        if let tmp = tmp {
            let toBeInserted = Node(data: item, next: tmp.next)
            tmp.next = toBeInserted
        }
    }
    
    func insertBefore(_ key: T, item: T) {
        if let head = head {
            if head.data == item {
                addFirst(item)
                return
            }
            var prev: Node<T>? = nil
            var cur: Node<T>? = head
            while cur != nil && cur?.data != key {
                prev = cur
                cur = cur?.next
            }
            if cur != nil {
                prev?.next = Node(data: item, next: cur)
            }
        }
    }
    
    func remove(_ key: T) {
        if let head = head {
            if head.data == key {
                self.head = head.next
                return
            }
            var prev: Node<T>? = nil
            var cur: Node<T>? = head
            while cur != nil && cur?.data != key {
                prev = cur
                cur = cur?.next
            }
            if cur != nil {
                prev?.next = cur?.next
            }
        }
    }
    
    fileprivate class Node<T: Equatable> {
        fileprivate var data: T
        fileprivate var next: Node<T>?
        
        init(data: T, next: Node<T>?) {
            self.data = data
            self.next = next
        }
    }
    
}
