//
//  Sort.swift
//  
//
//  Created by Yubo Qin on 12/1/22.
//

import Foundation

func bubbleSort(data: inout [Int]) {
    for outerIdx in stride(from: data.count - 1, to: 0, by: -1) {
        for innerIdx in 0 ..< outerIdx {
            if data[innerIdx] > data[innerIdx + 1] {
                (data[innerIdx], data[innerIdx + 1]) = (data[innerIdx + 1], data[innerIdx])
            }
        }
    }
}

func selectionSort(data: inout [Int]) {
    for outerIdx in 0 ..< data.count - 1 {
        // set initial min value's index
        var minimum = outerIdx
        // select a new minimum value's index
        for innerIdx in outerIdx + 1 ..< data.count {
            if data[innerIdx] < data[minimum] {
                // if new min, reset index
                minimum = innerIdx
            }
        }
        if outerIdx != minimum {
            (data[outerIdx], data[minimum]) = (data[minimum], data[outerIdx])
        }
    }
}

func insertionSort(data: inout [Int]) {
    guard !data.isEmpty else {
        return
    }
    for outerIdx in 1 ..< data.count {
        let tmp = data[outerIdx]
        var innerIdx = outerIdx
        // go backward in the left side of the line
        // shift the values
        while innerIdx > 0, data[innerIdx - 1] >= tmp {
            data[innerIdx] = data[innerIdx - 1]
            innerIdx -= 1
        }
        if outerIdx != innerIdx {
            data[innerIdx] = tmp
        }
    }
}

func mergeSort(data: [Int]) -> [Int] {

    // helper that merges two parts
    func merge(_ a: [Int], _ b: [Int]) -> [Int] {
        var merged: [Int] = []
        var aIdx = 0
        var bIdx = 0
        while aIdx < a.count && bIdx < b.count {
            if a[aIdx] < b[bIdx] {
                merged.append(a[aIdx])
                aIdx += 1
            } else {
                merged.append(b[bIdx])
                bIdx += 1
            }
        }
        if aIdx < a.count {
            merged += a[aIdx ..< a.count]
        }
        if bIdx < b.count {
            merged += b[bIdx ..< b.count]
        }
        return merged
    }

    if data.count <= 1 {
        return data
    }

    let mid = data.count / 2
    // create left array
    let left = Array(data[0 ..< mid])
    // create right array
    let right = Array(data[mid ..< data.count])
    // call itself with left half
    let sortedLeft = mergeSort(data: left)
    // call itself with right half
    let sortedRight = mergeSort(data: right)
    // merge
    return merge(sortedLeft, sortedRight)
}

func quickSort(data: inout [Int]) {

    func partition(arr: inout [Int], left: Int, right: Int, pivot: Int) -> Int {
        var leftPtr = left
        var rightPtr = right
        while true {
            while arr[leftPtr] < pivot {
                leftPtr += 1
            }
            while rightPtr > 0, arr[rightPtr] > pivot {
                rightPtr -= 1
            }
            if leftPtr >= rightPtr {
                break
            } else {
                (arr[leftPtr], arr[rightPtr]) = (arr[rightPtr], arr[leftPtr])
            }
        }
        return leftPtr
    }

    func quickSortHelper(data: inout [Int], left: Int, right: Int) {
        // base case
        if left >= right {
            return
        }
        // last value is pivot
        let pivot = data[right]
        let partition = partition(arr: &data, left: left, right: right, pivot: pivot)
        quickSortHelper(data: &data, left: left, right: partition - 1)
        quickSortHelper(data: &data, left: partition + 1, right: right)
    }

    quickSortHelper(data: &data, left: 0, right: data.count - 1)

}

func quickSortV2(data: [Int]) -> [Int] {
    if data.count <= 1 {
        return data
    }
    var unsorted = data
    // initialize arrays
    var left: [Int] = []
    var right: [Int] = []
    // pick pivot value
    let pivot = unsorted.popLast()!
    for x in unsorted {
        if x < pivot {
            left.append(x)
        } else {
            right.append(x)
        }
    }
    // call itself
    return quickSortV2(data: left) + [pivot] + quickSortV2(data: right)
}
