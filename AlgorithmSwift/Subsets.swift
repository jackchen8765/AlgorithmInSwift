//
//  Subsets.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/31/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
Objective: Given a number N, Write an algorithm to print all possible subsets with Sum equal to N

Example:

N=4

1111
112
121
13
211
22
31
4
 */




func printAllSubsets(of sum: Int, _ str: String = "") {
    if sum == 0 {
        print(str)
        return
    }
    
    var str = str
    for i in 1...sum{
        str += "\(i)"
        printAllSubsets(of: sum - i, str)
        str = String(str.dropLast())
    }
}

func allSubsets(of sum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    var sub = [Int]()
    
    func subsets(_ n: Int) {
        if n == 0 {
            result.append(sub)
            return
        }
        

        for i in 1...n {
            sub.append(i)
            subsets(n - i)
            sub.removeLast()
        }
    }
    
    subsets(sum)
    
    return result
}

/* Given a sorted positive integer array, say [2, 6, 10, 4], find how many subsets whose sum equals to Sum, say 16.
 
The answer is 2 subsets.
 
*/

func countSubsetsOfSum(_ a: [Int], _ sum: Int) -> Int {
    func subsets(_ a: [Int], _ sum: Int, _ index: Int) -> Int {
        if sum == 0 {
            return 1
        }
        else if sum < 0 {
            return 0
        }
        else if index < 0 {
            return 0
        }
        else if sum < a[index] {
            return subsets(a, sum, index - 1)
        }
        else {
            return subsets(a, sum - a[index], index - 1) + subsets(a, sum, index - 1)
        }
    }
    return subsets(a, sum, a.count - 1)
}
