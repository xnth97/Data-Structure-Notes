//
//  Queue.swift
//  
//
//  Created by Yubo Qin on 11/29/22.
//

import Foundation

class Queue<T> {

    private var array: [T]

    init() {
        self.array = []
    }

    var isEmpty: Bool {
        array.isEmpty
    }

    func enqueue(_ item: T) {
        array.append(item)
    }

    @discardableResult
    func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        let first = array.first
        array.remove(at: 0)
        return first
    }

    func peekFront() -> T? {
        return array.first
    }

}

extension Queue: CustomStringConvertible {

    var description: String {
        return "Queue: \(array)"
    }

}
