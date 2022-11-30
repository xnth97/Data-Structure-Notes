//
//  Stack.swift
//  
//
//  Created by Yubo Qin on 11/29/22.
//

import Foundation

class Stack<T> {

    private var array: [T]

    init() {
        self.array = []
    }

    var isEmpty: Bool {
        array.isEmpty
    }

    func push(_ item: T) {
        array.append(item)
    }

    @discardableResult
    func pop() -> T? {
        return array.popLast()
    }

    func peek() -> T? {
        return array.last
    }

}

extension Stack: CustomStringConvertible {

    var description: String {
        return "Stack: \(array)"
    }

}
