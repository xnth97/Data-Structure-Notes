//
//  BinarySearch.swift
//  DataStructureSwift
//
//  Created by Yubo Qin on 2017/12/19.
//  Copyright © 2017年 Yubo Qin. All rights reserved.
//

import Cocoa

class BinarySearch {
    
    class func binarySearch(data: [Int], key: Int) -> Int {
        var lowerBound = 0
        var upperBound = data.count - 1
        var mid = 0
        while true {
            if lowerBound > upperBound {
                return -1
            }
            // 直接使用 (lowerBound + upperBound) / 2 可能导致超出 Int 范围溢出
            mid = lowerBound + (upperBound - lowerBound) / 2
            if data[mid] == key {
                return mid
            }
            if data[mid] < key {
                lowerBound = mid + 1
            } else {
                upperBound = mid - 1
            }
        }
    }

}
