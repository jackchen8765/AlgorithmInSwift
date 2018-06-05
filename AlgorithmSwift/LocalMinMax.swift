//
//  LocalMinMax.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/30/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation


/*
 [1,2,3,4,3,2,1] --> local max is 4
 [1,2,3,4,5,6,7] --> No local max
 [5,4,3,2,3,4] --> local min is 2
 [5,4,3,2,1,0] --> no local min
 */


func localMinMax(_ numbers: [Int]) ->(min: Int?, max: Int?) {
    let size = numbers.count
    
    guard size > 3 else {
        return (nil, nil)
    }
    
    let first = numbers[0]
    let last = numbers[size  - 1]
    if first + size - 1 == last || first - size + 1 == last {
        return (nil, nil)
    }
    
    if first < numbers[1] {
        let expectedLast = first + size - 1
        return (nil, (expectedLast + last)/2)
    }
    else {
        let expectedLast = first - size + 1
        return ((expectedLast + last)/2, nil)
    }
}

func indexFromAscendingToDescending(_ numbers: [Int]) -> Int? {
    guard numbers.count > 2 else {
        return nil
    }

    var start = numbers.startIndex
    var end = numbers.endIndex - 1
    
    while start < end {
        let mid = (start + end) / 2
        if mid == numbers.startIndex || mid == numbers.endIndex - 1{
            return nil
        }
        
        let prev = numbers[mid - 1]
        let curr = numbers[mid]
        let next = numbers[mid + 1]
        
        if prev < curr && next < curr {
            return mid
        }
        else if prev <= curr && curr <= next {
            start = mid + 1
        }
        else {
            end = mid
        }
    }
    return nil
}

