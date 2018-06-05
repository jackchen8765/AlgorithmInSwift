//
//  RodProfitProblem.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/4/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Dynamic Programming – Rod Cutting Problem
 Objective: Given a rod of length n inches and a table of prices pi, i=1,2,…,n, write an algorithm to find the maximum revenue rn obtainable by cutting up the rod and selling the pieces.
 
 This is very good basic problem after fibonacci sequence if you are new to Dynamic programming. We will see how the dynamic programming is used to overcome the issues with recursion(Time Complexity).
 
 Given: Rod lengths are integers and For i=1,2,…,n we know the price pi of a rod of length i inches
 
 Example:
 
 Length    1    2    3    4    5     6     7     8     9     10
 Price     1    5    8    9    10    17    17    20    24    30

 */

func maxProfitsOfCuts(_ prices: [Double], rodLen: Int) -> Double {
    guard prices.count >= rodLen else {
        return 0.0
    }
    
    var profits = [Double](repeatElement(0.0, count: rodLen+1))
    
    for i in 1..<rodLen+1 {
        var mp: Double = 0.0
        for j in 0..<i {
            mp = max(mp, prices[j] + profits[i - (j+1)])
            profits[i] = mp
        }
    }
    return profits[rodLen]
}
