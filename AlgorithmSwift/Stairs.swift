//
//  Stairs.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/2/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit

/*
 Dynamic Programming – Stairs Climbing Puzzle
 Objective: A child is climbing up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can jump up the stairs.
 
 Example:
 
 Number of stairs : 3
 
 Number of ways = 4 ( {1,1,1}, {1,2}, {2,1}, {3} )
 */



func possibleStairWays(_ stairs: Int, _ mem: inout [Int]) -> Int {
    guard mem.count > stairs else {
        return 0
    }
    if stairs < 1 {
        return 0
    }
    
    if mem[stairs] > 0 {
        return mem[stairs]
    }
    else {
        mem[stairs] = 1 + possibleStairWays(stairs - 3, &mem) +
                        possibleStairWays(stairs - 2, &mem) +
                        possibleStairWays(stairs - 1, &mem)
        return mem[stairs]
    }
    
}
