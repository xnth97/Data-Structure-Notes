//
//  HashTable.swift
//  DataStructureSwift
//
//  Created by Yubo Qin on 2017/12/19.
//  Copyright © 2017年 Yubo Qin. All rights reserved.
//

import Foundation

class HashTable {
    // inner data structure
    fileprivate var hashArray: [DataItem?]
    // item to mark as deleted
    fileprivate let DELETED = DataItem(key: -1)
    // constructor
    init(initialCapacity: Int) {
        hashArray = [DataItem?](repeating: nil, count: initialCapacity)
    }
    
    fileprivate func hashFunc(_ key: Int) -> Int {
        return key % hashArray.count
    }
    
    func search(_ key: Int) -> Bool {
        var hashVal = hashFunc(key)
        while hashArray[hashVal] != nil {
            if hashArray[hashVal]!.key == key {
                return true
            }
            hashVal += 1
            // 每次都取模防止溢出
            hashVal %= hashArray.count
        }
        return false
    }
    
    func delete(_ key: Int) -> Int {
        var hashVal = hashFunc(key)
        while hashArray[hashVal] != nil {
            if hashArray[hashVal]!.key == key {
                let val = hashArray[hashVal]!.key
                hashArray[hashVal] = DELETED
                return val
            }
            hashVal += 1
            hashVal %= hashArray.count
        }
        return -1
    }
    
    func insert(_ key: Int) {
        let item = DataItem(key: key)
        var hashVal = hashFunc(key)
        while hashArray[hashVal] != nil && hashArray[hashVal]!.key != -1 {
            hashVal += 1
            hashVal %= hashArray.count
        }
        hashArray[hashVal] = item
    }
    
    // inner class of data item
    fileprivate class DataItem {
        fileprivate var key: Int
        init(key: Int) {
            self.key = key
        }
    }
}
