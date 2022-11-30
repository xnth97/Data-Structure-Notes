//
//  BinarySearch.swift
//  
//
//  Created by Yubo Qin on 11/29/22.
//

import Foundation

func binarySearch(data: [Int], key: Int) -> Int {
    guard !data.isEmpty else {
        return NSNotFound
    }

    var lowerBound = 0
    var upperBound = data.count - 1
    var mid = 0

    while true {
        if lowerBound > upperBound {
            return NSNotFound
        }
        // 注意：直接使用 (lowerBound + upperBound) / 2 可能导致超出 Int 范围溢出
        mid = lowerBound + (upperBound - lowerBound) / 2
        if data[mid] == key {
            return mid
        } else if data[mid] < key {
            lowerBound = mid + 1
        } else {
            upperBound = mid - 1
        }
    }
}
