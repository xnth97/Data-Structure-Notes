//
//  Heap.swift
//  
//
//  Created by Yubo Qin on 11/30/22.
//

import Foundation

class MaxHeap<T: Comparable> {

    class Node<T> {
        let key: T
        init(key: T) {
            self.key = key
        }
    }

    private var heapArray: [Node<T>]

    init() {
        self.heapArray = []
    }

    func insert(_ key: T) {
        let node = Node(key: key)
        heapArray.append(node)
        percolateUp(index: heapArray.count - 1)
    }

    private func percolateUp(index: Int) {
        // save the bottom node
        guard let bottom = heapArray.last else {
            return
        }
        var index = index
        // find the initial index value of parent
        var parent = (index - 1) / 2
        // while parent's key is smaller than the new key
        while index > 0 && heapArray[parent].key < bottom.key {
            // parent node comes down
            heapArray[index] = heapArray[parent]
            // index moves up
            index = parent
            // continue with its parent
            parent = (parent - 1) / 2
        }
        // finally, insert newly added node into proper position
        heapArray[index] = bottom
    }

    func removeMax() -> Node<T>? {
        guard let root = heapArray.first else {
            return nil
        }
        if let last = heapArray.last {
            heapArray[0] = last
            heapArray.removeLast()
        }
        if !heapArray.isEmpty {
            perculateDown(index: 0)
        }
        return root
    }

    private func perculateDown(index: Int) {
        var index = index
        let top = heapArray[index]
        // index of larger child
        var largerChild = -1
        while index < heapArray.count / 2 {
            let leftChild = index * 2 + 1
            let rightChild = (index + 1) * 2
            // find which child is larger
            if rightChild < heapArray.count,
               heapArray[leftChild].key < heapArray[rightChild].key {
                largerChild = rightChild
            } else {
                largerChild = leftChild
            }
            // no need to go down any more
            if heapArray[largerChild].key < top.key {
                break
            }
            // move the nodes up
            heapArray[index] = heapArray[largerChild]
            // index goes down towards larger child
            index = largerChild
        }
        // put top key into proper location to restore the heap
        heapArray[index] = top
    }

}

func heapSort(data: [Int]) -> [Int] {
    let heap = MaxHeap<Int>()
    for i in data {
        heap.insert(i)
    }
    var ret: [Int] = []
    for _ in 0 ..< data.count {
        if let max = heap.removeMax() {
            ret.insert(max.key, at: 0)
        }
    }
    return ret
}

extension MaxHeap: CustomStringConvertible {
    var description: String {
        return "MaxHeap: \(heapArray)"
    }
}

extension MaxHeap.Node: CustomStringConvertible {
    var description: String {
        return "\(key)"
    }
}
