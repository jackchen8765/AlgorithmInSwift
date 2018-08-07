//
//  Sudoku.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/14/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 SUDOKU Puzzle : The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called “boxes”, “blocks”, “regions”, or “sub-squares”) contains all of the digits from 1 to 9.
 
 Input:
  [0,0,7,4,0,3,0,8,0]
  [0,0,0,0,2,0,4,7,1]
  [0,0,6,0,0,5,0,0,0]
  [3,0,1,0,0,8,0,0,0]
  [0,5,0,0,6,0,0,3,0]
  [0,0,0,3,0,0,5,0,2]
  [0,0,0,9,0,0,8,0,0]
  [7,8,9,0,3,0,0,0,0]
  [0,3,0,2,0,4,7,0,0]
 
 Output:
 
 [2, 1, 7, 4, 9, 3, 6, 8, 5]
 [5, 9, 3, 8, 2, 6, 4, 7, 1]
 [8, 4, 6, 1, 7, 5, 3, 2, 9]
 [3, 2, 1, 5, 4, 8, 9, 6, 7]
 [9, 5, 4, 7, 6, 2, 1, 3, 8]
 [6, 7, 8, 3, 1, 9, 5, 4, 2]
 [4, 6, 2, 9, 5, 7, 8, 1, 3]
 [7, 8, 9, 6, 3, 1, 2, 5, 4]
 [1, 3, 5, 2, 8, 4, 7, 9, 6]
 
 
 */

func soduku(_ matrix: [[Int]]) -> [[Int]]? {
    guard matrix.count == 9 && matrix[0].count == 9 else {
        return nil
    }
    let w = matrix[0].count
    let h = matrix.count
    var solution = matrix
    
    func findEmptyCell() -> (row: Int, col: Int)? {
        for i in 0..<h {
            for j in 0..<w {
                if solution[i][j] == 0 {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    func used(_ n: Int, inRow row: Int) -> Bool {
        for j in 0..<w {
            if solution[row][j] == n {
                return true
            }
        }
        return false
    }
    
    func used(_ n: Int, inColume col: Int) -> Bool {
        for i in 0..<h {
            if solution[i][col] == n {
                return true
            }
        }
        return false
    }
    
    func used(_ n: Int, inBox row: Int, col: Int) -> Bool {
        let boxStartRow = row - row % 3
        let boxStartCol = col - col % 3
        for i in 0..<3 {
            for j in 0..<3 {
                if solution[boxStartRow + i][boxStartCol + j] == n {
                    return true
                }
            }
        }
        return false
    }
    
    func isSafe(_ row: Int, _ col: Int, number: Int) -> Bool {
        if !(used(number, inRow: row)  ||
            used(number, inColume: col) ||
            used(number, inBox: row, col: col)) {
            return true
        }
        return false
    }
    
    func solve() -> Bool {
        if let cell = findEmptyCell() {
            let i = cell.row
            let j = cell.col
            
            for n in 1...9 {
                if isSafe(i, j, number: n) {
                    solution[i][j] = n
                    
                    if solve() {
                        return true
                    }
                    
                    //back track
                    solution[i][j] = 0
                }
            }
            return false
        }
        else {
            return true
        }
    }
    
    if solve() {
        return solution
    }
    else {
        return nil
    }
}
