//
//  CoinProblems.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/4/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation


/*
 Given a value N, if we want to make change for N cents, and we have infinite supply of each of S = { S1, S2, .. , Sm} valued coins, how many ways can we make the change? The order of coins doesn’t matter.
 
 For example, for N = 4 and S = {1,2,3}, there are four solutions: {1,1,1,1},{1,1,2},{2,2},{1,3}. So output should be 4. For N = 10 and S = {2, 5, 3, 6}, there are five solutions: {2,2,2,2,2}, {2,2,3,3}, {2,2,6}, {2,3,5} and {5,5}. So the output should be 5.
 
 1) Optimal Substructure
 To count total number solutions, we can divide all set solutions in two sets.
 1) Solutions that do not contain mth coin (or Sm).
 2) Solutions that contain at least one Sm.
 Let count(S[], m, n) be the function to count the number of solutions, then it can be written as sum of count(S[], m-1, n) and count(S[], m, n-Sm).
 
 Therefore, the problem has optimal substructure property as the problem can be solved using solutions to subproblems.
 
 */

func countOfWayUsingCoins(_ coins: [Int], value: Int) ->Int  {
    let m = coins.count
    guard m > 0 else {
        return 0
    }
    guard value > 0 else {
        return 1
    }
    
    var result:[[Int]] = [[Int]](repeatElement([Int](repeatElement(0, count: m)), count: value + 1))
    
    for j in 0..<m {
        result[0][j] = 1
    }
    
    for i in 1..<value+1 {
        for j in 0..<m {
            let leftValue = i - coins[j] //left value after using coins[j]
            let x = leftValue >= 0 ? result[leftValue][j] : 0
            let y = (j >= 1) ? result[i][j-1] : 0
            result[i][j] = x + y
        }
    }
    return result[value][m-1]
}


/*
 Given a value V, if we want to make change for V cents, and we have infinite supply of each of C = { C1, C2, .. , Cm} valued coins, what is the minimum number of coins to make the change?
 
 Input: coins[] = {25, 10, 5}, V = 30
 Output: Minimum 2 coins required
 We can use one coin of 25 cents and one of 5 cents
 
 */

func minNumberOfCoins(_ coins: [Int], value: Int ) -> Int {
    let c = coins.count
    guard c > 0 else {
        return 0
    }
    guard value > 0 else {
        return 0
    }
    
    var result:[Int] = [Int](repeatElement(Int.max, count: value+1))
    
    result[0] = 0
    
    for i in 1..<value+1 {
        for j in 0..<c {
            if coins[j] <= i {
                let subResult = result[i - coins[j]]
                if subResult != Int.max && subResult + 1 < result[i] {
                    result[i] = subResult + 1
                }
            }
        }
    }
    return result[value]
}
