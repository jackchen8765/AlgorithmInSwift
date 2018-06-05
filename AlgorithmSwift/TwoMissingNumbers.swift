//
//  TwoMissingNumbers.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/3/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Given an array of n unique integers where each element in the array is in range [1, n]. The array has all distinct elements and size of array is (n-2). Hence Two numbers from the range are missing from this array. Find the two missing numbers.
 
 Requirement: Time: O(n), Space: O(1)
 
 Examples:
 
 Input  : arr[] = {1, 3, 5, 6}, n = 6
 Output : 2 4
 
 Input : arr[] = {1, 2, 4}, n = 5
 Output : 3 5
 
 Input : arr[] = {1, 2}, n = 4
 Output : 3 4
 
 */

func findTwoMissingNumbers(_ numbers: [Int]) -> (Int, Int) {
    let size = numbers.count + 2
    if size == 2 {
        return (1,2)
    }
    
    var xorAll = 0
    for i in 1...size {
        xorAll ^= i
    }
    
    for i in 0..<numbers.count{
        xorAll ^= numbers[i]
    }
    
    let rightMostSetBit = xorAll & (~(xorAll - 1))
    
    var x = 0
    var y = 0
    
    for i in 1...size {
        if i & rightMostSetBit > 0 {
            x ^= i
        }
        else {
            y ^= i
        }
    }
    
    for i in 0..<numbers.count {
        if numbers[i] & rightMostSetBit > 0 {
            x ^= numbers[i]
        }
        else {
            y ^= numbers[i]
        }
    }
    return (x,y)
}
