//
//  Knapsack.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/15/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func knapSackNaive(_ weightValues: [(w: Int, v: Int)], _ maxWeight: Int) -> Int {
    
    func ks(_ wv: [(w: Int, v: Int)], _ maxWeight: Int, _ n: Int)->Int {
        if n == 0 || maxWeight == 0 {
            return 0
        }
        else if wv[n - 1].w > maxWeight {
            return ks(wv, maxWeight, n - 1)
        }
        else {
            let v1 = ks(wv, maxWeight, n - 1)
            let v2 = wv[n - 1].v + ks(wv, maxWeight - wv[n - 1].w, n - 1)
            return max(v1, v2)
        }
    }
    
    return ks(weightValues, maxWeight, weightValues.count)
}

func knapSackDP(_ weightValues: [(w: Int, v: Int)], _ maxWeight: Int) -> Int {
    let n = weightValues.count
    let c = maxWeight
    guard n > 0 && c > 0 else {
        return 0
    }
    var mem: [[Int]] = Array(repeatElement(Array(repeatElement(0, count: c + 1)), count: n + 1))
    
    func ks(_ wv: [(w: Int, v: Int)], _ maxWeight: Int, _ n: Int)->Int {
        for i in 0...n {
            for j in 0...c {
                if i == 0 || c == 0 {
                    mem[i][j] = 0
                }
                else if wv[i - 1].w > j {
                    mem[i][j] = mem[i - 1][j]
                }
                else {
                    let v1 = wv[i-1].v + mem[i-1][j - wv[i-1].w]
                    let v2 = mem[i-1][j]
   
                    mem[i][j] = max(v1, v2)
                }
            }
        }
        return mem[n][c]
    }
    return ks(weightValues, c, n)
}
