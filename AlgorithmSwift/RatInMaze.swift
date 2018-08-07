//
//  RatInMaze.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/14/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Given a maze, NxN matrix. A rat has to find a path from source to destination. maze[0][0] (left top corner)is the source and maze[N-1][N-1](right bottom corner) is destination. There are few cells which are blocked, means rat cannot enter into those cells. Rat can move in any direction ( left, right, up and down).
 
 Input: A 2D-matrix with 0’s and 1’s fill in it. 0 means that cell is blocked and 1 means rat can move to that cell.
 
 [1, 1, 1, 0, 0, 0, 0]
 [1, 0, 1, 0, 1, 1, 1]
 [1, 0, 1, 1, 1, 0, 1]
 [1, 0, 0, 0, 0, 1, 1]
 [1, 0, 0, 0, 1, 1, 0]
 [1, 1, 1, 1, 0, 1, 1]
 [1, 0, 1, 0, 0, 0, 1]
 
 
 Output:
 
 [1, 1, 1, 0, 0, 0, 0]
 [0, 0, 1, 0, 1, 1, 1]
 [0, 0, 1, 1, 1, 0, 1]
 [0, 0, 0, 0, 0, 1, 1]
 [0, 0, 0, 0, 0, 1, 0]
 [0, 0, 0, 0, 0, 1, 1]
 [0, 0, 0, 0, 0, 0, 1]
 
 
 */

func ratPath(in maze: [[Int]]) -> [[Int]]? {
    guard maze.count > 0 && maze[0].count > 0 else {
        return nil
    }
    
    let h = maze.count
    let w = maze[0].count
    
    
    var solution = [[Int]](repeatElement([Int](repeatElement(0, count: w)), count: h))

    
    
    func canMove(_ row: Int, _ col: Int) -> Bool {
        if row >= 0 && row < h && col >= 0 && col < w &&
            solution[row][col] == 0 && maze[row][col] != 0{
            return true
        }
        else {
            return false
        }
    }
    
    func moveTo(_ row: Int, _ col: Int) -> Bool {
        if row == h - 1 && col == w - 1 {
            solution[row][col] = 1
            return true
        }
        
        if canMove(row, col) {
            solution[row][col] = 1
            
            //go right
            if moveTo(row, col + 1) {
                return true
            }
            
            //go down
            if moveTo(row + 1, col) {
                return true
            }
            
            //go left
            if moveTo(row, col - 1) {
                return true
            }
            
            //go up
            if moveTo(row - 1, col) {
                return true
            }
            
            solution[row][col] = 0
            return false
        }
        return false
    }
    
    if moveTo(0, 0) {
        return solution
    }
    return nil
}
