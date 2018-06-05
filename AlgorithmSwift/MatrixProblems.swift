//
//  MatrixProblems.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/3/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Count all paths from top left to bottom right of a mXn matrix
 */

func countOfPaths(rows: Int, cols: Int) -> Int {
    guard rows > 0 && cols > 0 else {
        return 0
    }

    var result = [[Int]](repeatElement([Int](repeatElement(1, count: cols)), count: rows))
    
    for row in 1..<rows {
        for col in 1..<cols {
            result[row][col] = result[row - 1][col] + result[row][col - 1]
        }
    }

    return result[rows - 1][cols - 1]
}



/*
 1  1  1  1  1
 1 -1  1  1  1
 1  1 -1  1  1
 1 -1  1 -1  1
 */

func countOfPaths(for matrix: [[Int]]) -> Int {
    let rows = matrix.count
    guard rows > 0 else {
        return 0
    }
    let cols = matrix[0].count
    guard cols > 0 else {
        return 0
    }
    
    var result = matrix
    
    for i in 1..<rows {
        for j in 1..<cols {
            if result[i][j] != -1 {
                result[i][j] = 0
                if result[i - 1][j] > 0 {
                    result[i][j] += result[i - 1][j]
                }
                if result[i][j - 1] > 0 {
                    result[i][j] += result[i][j - 1]
                }
            }
        }
    }
    return result[rows - 1][cols - 1]
}
