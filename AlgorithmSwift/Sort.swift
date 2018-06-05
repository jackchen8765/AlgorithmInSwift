//
//  Sort.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/8/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


func insertSort<T: Comparable>(_ a: inout [T]) {
    if a.count <= 1 {
        return
    }
    
    for i in 1..<a.count {
        let temp = a[i]
        var j = i - 1
        
        while j >= 0 && a[j] > temp {
            a[j+1] = a[j]
            j -= 1
        }
        a[j+1] = temp
    }
}


func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count/2]
    
    let less = a.filter{$0 < pivot}
    let equal = a.filter{$0 == pivot }
    let greater = a.filter{$0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}

private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var result = [T]()
    var i = 0
    var j = 0

    while i < left.count && j < right.count {
        if left[i] < right[j] {
            result.append(left[i])
            i += 1
        }
        else if left[i] > right[j]  {
            result.append(right[j])
            j += 1
        }
        else {
            result.append(left[i])
            result.append(right[j])
            i += 1
            j += 1
        }
    }

    if i < left.count {
        result += [T](left[i..<left.count])
    }
        
    if j < right.count {
        result += [T](right[j..<right.count])
    }

    return result
}

func mergeSort<T:Comparable>(_ list: inout [T]) {
    if list.count <= 1 {
        return
    }

    let mid = list.count / 2
    var left = [T](list[0..<mid])
    var right = [T](list[mid..<list.count])
 
    mergeSort(&left)
    mergeSort(&right)
    
    list = merge(left, right)
}


class MinHeap<T> {
    var node: T?
    
    public func popMin() -> T? { return node}
    
    public func  min() -> T? {return node}
    
    public func add(_ a: T) { node = a}
    
}

func mergeSortedArrays( _ a: [[Int]]) -> [Int]
{
    let minHeap = MinHeap<Int>()
    
    var total = 0
    var inserted = 0
    
    //get the total of items
    //and by the way insert the first element of each sub array
    for i in 0..<a.count {
        if a[i].count > 0 {
            total += a[i].count
            minHeap.add(a[i][0])
            inserted += 1
        }
    }
    
    var result = [Int]()
    guard total > 0 else {
        return result
    }
    
    //start from the second column
    var j = 1
    var nextSmallest = Int.max
    while inserted < total {
        for i in 0..<a.count {
            if a[i].count > j{
                let item = a[i][j]
                minHeap.add(item)
                inserted += 1
                if item < nextSmallest {
                    nextSmallest = item
                }
            }
        }
        j  += 1
        
        while let nextHeapMin = minHeap.min() {
            if nextHeapMin < nextSmallest {
                result.append(minHeap.popMin()!)
            }
        }
    }
    
    while let nextMin = minHeap.popMin() {
        result.append(nextMin)
    }
    return result
}

func countOccurrencesOfKey(_ key: Int, inArray a: [Int]) -> Int {
    func leftBoundary() -> Int {
        var low = 0
        var high = a.count
        while low < high {
            let midIndex = low + (high - low)/2
            if a[midIndex] < key {
                low = midIndex + 1
            } else {
                high = midIndex
            }
        }
        return low
    }
    
    func rightBoundary() -> Int {
        var low = 0
        var high = a.count
        while low < high {
            let midIndex = low + (high - low)/2
            if a[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        return low
    }
    
    return rightBoundary() - leftBoundary()
}


func sortByLastName(_ fullNames: [String]) -> [String] {
    return fullNames.sorted(by: ){(name1: String, name2: String) in
        let name1Array = name1.components(separatedBy: " ")
        let lastName1 = name1Array.last ?? name1
        let name2Array = name2.components(separatedBy: " ")
        let lastName2 = name2Array.last ?? name2
        return lastName1 < lastName2
    }
}
