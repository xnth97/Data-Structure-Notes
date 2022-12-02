//
//  HashTable.swift
//  
//
//  Created by Yubo Qin on 11/30/22.
//

import Foundation

class HashTable {

    class DataItem {
        let key: Int
        init(key: Int) {
            self.key = key
        }
    }

    private var hashArray: [DataItem?]

    init(initialCapacity: Int) {
        self.hashArray = Array(repeating: nil, count: initialCapacity)
    }

    func search(_ key: Int) -> Bool {
        var hashVal = hash(key)
        while hashArray[hashVal] != nil {
            if hashArray[hashVal]?.key == key {
                return true
            }
            hashVal += 1
            // 每次都取模防止溢出
            hashVal %= hashArray.count
        }
        return false
    }

    @discardableResult
    func delete(_ key: Int) -> Int {
        var hashVal = hash(key)
        while let dataItem = hashArray[hashVal] {
            if dataItem.key == key {
                hashArray[hashVal] = nil
                return key
            }
            hashVal += 1
            hashVal %= hashArray.count
        }
        return NSNotFound
    }

    func insert(key: Int) {
        let item = DataItem(key: key)
        var hashVal = hash(key)
        while hashArray[hashVal] != nil {
            hashVal += 1
            hashVal %= hashArray.count
        }
        hashArray[hashVal] = item
    }

    private func hash(_ key: Int) -> Int {
        return key % hashArray.count
    }

}

extension HashTable: CustomStringConvertible {
    var description: String {
        return "HashTable: \(hashArray.map { $0?.key ?? -1 })"
    }
}
