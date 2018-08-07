//
//  QueenProblem.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/12/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 
 Put N Queens on the N X N chess board so that none of them can hit any other in one move.
 
 1) Start in the leftmost column
 2) If all queens are placed
 return true
 3) Try all rows in the current column.  Do following for every tried row.
 a) If the queen can be placed safely in this row then mark this [row,
 column] as part of the solution and recursively check if placing
 queen here leads to a solution.
 b) If placing the queen in [row, column] leads to a solution then return
 true.
 c) If placing queen doesn't lead to a solution then umark this [row,
 column] (Backtrack) and go to step (a) to try other rows.
 3) If all rows have been tried and nothing worked, return false to trigger
 backtracking.
 
 
 Output of 4 x 4, "1" is for the place you put a Qeen.
 
 0 0 1 0
 1 0 0 0
 0 0 0 1
 0 1 0 0

 */

func queenPositions(_ numberOfQueens: Int) -> [[Int]] {
    guard numberOfQueens > 0 else {
        return [[]]
    }
    
    var solution = [[Int]](repeatElement([Int](repeatElement(0, count: numberOfQueens)), count: numberOfQueens))
    
    func canPlace(_ board: [[Int]], _ row: Int, _ col: Int) -> Bool {
        for j in 0..<col {
            if board[row][j] == 1 {
                return false
            }
        }
        
        var i = row
        var j = col
        while i >= 0 && j >= 0 {
            if board[i][j] == 1 {
                return false
            }
            i -= 1
            j -= 1
        }
        
        i = row
        j = col
        while i < board.count && j >= 0 {
            if board[i][j] == 1 {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
    
    func place(queen: Int) -> Bool{
        if queen == numberOfQueens {
            return true
        }
        
        let j = queen
        for row in 0..<numberOfQueens {
            if canPlace(solution, row, j) {
                //place the queen
                solution[row][j] = 1
                
                //place the next queen
                if place(queen: j + 1) {
                    return true
                }
                
                //back track
                solution[row][j] = 0
            }
        }
        
        return false
    }
    
    
    if place(queen: 0) {
        return solution
    }
    else {
        return [[]]
    }

}
