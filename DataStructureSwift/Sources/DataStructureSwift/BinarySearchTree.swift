//
//  BinarySearchTree.swift
//  
//
//  Created by Yubo Qin on 11/30/22.
//

import Foundation

class BinarySearchTree<K: Comparable, V> {

    class Node<K: Comparable, V>: Equatable {

        let key: K
        let value: V
        var left: Node<K, V>?
        var right: Node<K, V>?

        init(key: K,
             value: V,
             left: Node<K, V>? = nil,
             right: Node<K, V>? = nil) {
            self.key = key
            self.value = value
            self.left = left
            self.right = right
        }

        static func == (lhs: Node<K, V>,
                        rhs: Node<K, V>) -> Bool {
            return lhs.key == rhs.key
                && lhs.left == rhs.left
                && lhs.right == rhs.right
        }
    }

    private(set) var root: Node<K, V>?

    init(root: Node<K, V>? = nil) {
        self.root = root
    }

    func search(key: K) -> Bool {
        guard root != nil else {
            return false
        }

        var current = root
        while current?.key != key {
            if current == nil {
                return false
            }
            if current!.key < key {
                current = current?.right
            } else {
                current = current?.left
            }
        }
        return true
    }

    func insert(key: K, value: V) {
        let newNode = Node(key: key, value: value)
        if root == nil {
            root = newNode
            return
        }

        var parent = root
        var current = root

        while true {
            if current?.key == key {
                return
            }
            parent = current
            if current != nil && current!.key < key {
                current = current!.right
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

    func delete(key: K) {
        if root == nil {
            return
        }

        var parent = root
        var current = root
        var isLeftChild = false

        // find the current node
        while current != nil, current?.key != key {
            parent = current
            if current != nil && current!.key > key {
                isLeftChild = true
                current = current!.left
            } else {
                isLeftChild = false
                current = current?.right
            }
        }

        // case 1: node not found
        guard let current else {
            return
        }

        // case 2: a leaf
        if current.left == nil && current.right == nil {
            if current == root {
                root = nil
                return
            }
            if isLeftChild {
                parent?.left = nil
            } else {
                parent?.right = nil
            }
        }

        // case 3: one child
        // only has left child
        else if current.right == nil {
            if current == root {
                root = current.left
                return
            }
            if isLeftChild {
                parent?.left = current.left
            } else {
                parent?.right = current.left
            }
        }

        // only has right child
        else if current.left == nil {
            if current == root {
                root = current.right
                return
            }
            if isLeftChild {
                parent?.left = current.right
            } else {
                parent?.right = current.right
            }
        }

        // case 4: two children
        else {
            let successor = getSuccessor(toDelete: current)
            if current == root {
                root = successor
                return
            }
            if isLeftChild {
                parent?.left = successor
            } else {
                parent?.right = successor
            }
            successor?.left = current.left
        }
    }

    private func getSuccessor(toDelete: Node<K, V>) -> Node<K, V>? {
        // find the minimum node in toDelete's right subtree
        var parent: Node<K, V>? = toDelete
        var successor: Node<K, V>? = toDelete
        var current = toDelete.right

        while current != nil {
            parent = successor
            successor = current
            current = current?.left
        }

        if successor != toDelete.right {
            parent?.left = successor?.right
            successor?.right = toDelete.right
        }

        return successor
    }

    func dfsTraverse() -> [Node<K, V>] {
        var res: [Node<K, V>] = []
        traverse(node: root, res: &res)
        return res
    }

    private func traverse(node: Node<K, V>?, res: inout [Node<K, V>]) {
        guard let node else {
            return
        }
        traverse(node: node.left, res: &res)
        res.append(node)
        traverse(node: node.right, res: &res)
    }

    func inorderTraverse() -> [Node<K, V>] {
        guard let root else {
            return []
        }
        var stack: [Node<K, V>] = []
        var res: [Node<K, V>] = []
        var current: Node<K, V>? = root
        while current != nil || !stack.isEmpty {
            // add all through the left-most node of the tree
            while current != nil {
                stack.append(current!)
                current = current!.left
            }
            current = stack.popLast()
            if current != nil {
                res.append(current!)
            }
            current = current?.right
        }
        return res
    }

    func preorderTraverse() -> [Node<K, V>] {
        guard let root else {
            return []
        }
        var stack = [root]
        var res: [Node<K, V>] = []
        while !stack.isEmpty {
            guard let current = stack.popLast() else {
                break
            }
            res.append(current)
            if let right = current.right {
                stack.append(right)
            }
            if let left = current.left {
                stack.append(left)
            }
        }
        return res
    }

    func postorderTraverse() -> [Node<K, V>] {
        guard let root else {
            return []
        }
        var stack = [root]
        var res: [Node<K, V>] = []
        while !stack.isEmpty {
            guard let current = stack.popLast() else {
                break
            }
            res.insert(current, at: 0)
            if let left = current.left {
                stack.append(left)
            }
            if let right = current.right {
                stack.append(right)
            }
        }
        return res
    }

}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        return "BST: \(dfsTraverse())"
    }
}

extension BinarySearchTree.Node: CustomStringConvertible {
    var description: String {
        return "\(key)"
    }
}
