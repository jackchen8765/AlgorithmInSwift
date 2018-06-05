//
//  Sum.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/16/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> (Int, Int)? {
    var dict: [ Int: Int] = [ : ]
    for (index, n) in nums.enumerated() {
        let complement = target - n
        if let complementIndex = dict[complement] {
            return (index, complementIndex)
        }
        
        dict[n] = index
    }
    return nil
}


func twoSortedSum(_ sorted: [Int], _ target: Int) -> (Int, Int)? {
    var i = 0
    var j = sorted.count - 1
    
    while i < j {
        let sum = sorted[i] + sorted[j]
        if sum == target {
            return (i, j)
        }
        else if sum < target {
            i += 1
        }
        else {
            j -= 1
        }
    }
    return nil
}


extension Collection where Self.Iterator.Element: Equatable {
    func formUniqueIndex(after index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(after: &index)
        } while index < endIndex && self[prev] == self[index]
    }
}

extension BidirectionalCollection where Self.Iterator.Element: Equatable  {
    func formUniqueIndex(before index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(before: &index)
        } while index > startIndex && self[prev] == self[index]
    }
}

func threeSum<T: BidirectionalCollection>(_ collection: T, target: T.Iterator.Element) -> [[T.Iterator.Element]] where T.Iterator.Element: Comparable, T.Iterator.Element == Int {
    let sorted = collection.sorted()
    var ret : [ [T.Iterator.Element] ] = []
    
    var left = sorted.startIndex
    
    while left < sorted.endIndex {
        defer {
            sorted.formUniqueIndex(after: &left)
        }
        var middle = sorted.index(after: left)
        var right = sorted.index(before: sorted.endIndex)
        
        while middle < right && right > sorted.startIndex {
            let sum = sorted[left] + sorted[middle] + sorted[right]
            if sum == target {
                ret.append([ sorted[left], sorted[middle], sorted[right] ])
                sorted.formUniqueIndex(after: &middle)
                sorted.formUniqueIndex(before: &right)
            }
            else if sum < target {
                sorted.formUniqueIndex(after: &middle)
            }
            else {
                sorted.formUniqueIndex(before: &right)
            }
        }
    }
    return ret
}

