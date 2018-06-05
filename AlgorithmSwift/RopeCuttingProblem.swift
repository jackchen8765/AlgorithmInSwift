//
//  RopeCuttingProblem.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/4/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 
 Maximum Product Cutting Problem
 
 Objective: Given a rope of length n meters, write an algorithm to cut the rope in such a way that product of different lengths of rope is maximum. At least one cut has to be made.
 
 Note: Assume that the length of rope is more than 2 meters, since at least one cut has to be made.
 
 */


func maxProductionOfCuts(_ ropeLength: Int) -> Int {
    guard ropeLength > 1 else {
        return 0
    }
    
    var mpc = [Int](repeatElement(1, count: ropeLength+1))
    
    for i in 2..<ropeLength+1 {
        var mp = -1
        for j in 1..<i {
            mp = max(mp, max(j * mpc[i - j], j * (i - j)))
        }
        mpc[i] = mp
    }
    return mpc[ropeLength]
}
