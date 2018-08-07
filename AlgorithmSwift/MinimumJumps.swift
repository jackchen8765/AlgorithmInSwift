//
//  MinimumJumps.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/7/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 
 Given an array of non negative integers, start from the first element and reach the last by jumping. The jump length can be at most the value at the current position in the array. Optimum result is when you reach the goal in minimum number of jumps.
 
 Given array A = {2,3,1,1,4}
 possible ways to reach the end (index list)
 i) 0,2,3,4 (jump 2 to index 2, then jump 1 to index 3 then 1 to index 4)
 ii) 0,1,4 (jump 1 to index 1, then jump 3 to index 4)
 
 Since the second solution has only 2 jumps it is the optimum result.
 
 */

/*
 startIndex = 0
 mem = [Int: Int]()
 
 return minimum jumps from startIndex to the end of the array
 */

func findMinJumps(_ array: [Int], startIndex: Int, _ mem: inout [Int: Int]) -> Int {
    //if we reach the end, we are done
    if startIndex == array.count - 1 {
        return 0
    }
    
    if let result = mem[startIndex] {
        return result
    }
    
    let remaining = array.count - startIndex
    //the value of the current position is equal to or greater than the remaining steps
    //we just need one jump
    if remaining <= array[startIndex] {
        return 1
    }
    
    //it's possible to jump from the current position
    if array[startIndex] == 0 {
        return Int.max
    }
    
    
    var jumps: Int = Int.max
    
    for i in 1...array[startIndex] {
        let temp = findMinJumps(array, startIndex: startIndex + i, &mem)
        if temp < Int.max {
            jumps = min(jumps, 1 + temp)
        }
    }
    mem[startIndex] = jumps
    
    return jumps
}
