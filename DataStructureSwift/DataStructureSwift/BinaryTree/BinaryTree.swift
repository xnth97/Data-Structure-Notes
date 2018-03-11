//
//  BinaryTree.swift
//  DataStructureSwift
//
//  Created by Yubo Qin on 2017/12/19.
//  Copyright © 2017年 Yubo Qin. All rights reserved.
//

import Foundation

class BinaryTree {
    fileprivate var root: Node?
    
    func find(_ key: Int) -> Bool {
        if root == nil {
            return false
        }
        var current = root
        while current!.key != key {
            if current!.key < key {
                current = current?.right
            } else {
                current = current?.left
            }
            if current == nil {
                return false
            }
        }
        return true
    }
    
    func insert(_ key: Int, value: Double) {
        let newNode = Node(key: key, value: value)
        if root == nil {
            root = newNode
            return
        }
        var parent = root
        var current = root
        while true {
            if current!.key == key {
                return
            }
            parent = current
            if current!.key < key {
                current = current?.right
                if current == nil {
                    parent?.right = newNode
                    return
                }
            } else {
                current = current?.left
                if current == nil {
                    parent?.left = newNode
                    return
                }
            }
        }
    }
    
    func delete(_ key: Int) {
        if root == nil {
            return
        }
        var parent = root
        var current = root
        var isLeftChild = false
        while current!.key != key {
            parent = current
            if current!.key < key {
                isLeftChild = false
                current = current?.right
            } else {
                isLeftChild = true
                current = current?.left
            }
            // case 1: not found
            if current == nil {
                return
            }
        }
        // case 2: a leaf
        if current?.left == nil && current?.right == nil {
            if current?.key == root?.key {
                root = nil
            } else if isLeftChild {
                parent?.left = nil
            } else {
                parent?.right = nil
            }
        }
        // case 3: one child
        else if current?.right == nil {
            // only has left child
            if current?.key == root?.key {
                root = current?.left
            } else if isLeftChild {
                parent?.left = current?.left
            } else {
                parent?.right = current?.left
            }
        } else if current?.left == nil {
            // only has right child
            if current?.key == root?.key {
                root = current?.right
            } else if isLeftChild {
                parent?.left = current?.right
            } else {
                parent?.right = current?.right
            }
        }
        // case 4: two children
        else {
            let successor = getSuccessor(current!)
            if current?.key == root?.key {
                root = successor
            } else if isLeftChild {
                parent?.left = successor
            } else {
                parent?.right = successor
            }
            successor.left = current?.left
        }
    }
    
    fileprivate func getSuccessor(_ toDelete: Node) -> Node {
        var successorParent = toDelete
        var successor = toDelete
        var current = toDelete.right
        while current != nil {
            successorParent = successor
            successor = current!
            current = current!.left
        }
        if successor.key != toDelete.right?.key {
            successorParent.left = successor.right
            successor.right = toDelete.right
        }
        return successor
    }
    
    func traverse() {
        inOrder(toVisit: root)
    }
    // 帮助方法
    fileprivate func inOrder(toVisit: Node?) {
        if let node = toVisit {
            inOrder(toVisit: node.left)
            print(node.value)
            inOrder(toVisit: node.right)
        }
    }
    
    // inner class Node
    fileprivate class Node {
        // fields
        fileprivate var key: Int
        fileprivate var value: Double
        fileprivate var left: Node?
        fileprivate var right: Node?
        // constructor
        init(key: Int, value: Double) {
            self.key = key
            self.value = value
            self.left = nil
            self.right = nil
        }
    }
}
