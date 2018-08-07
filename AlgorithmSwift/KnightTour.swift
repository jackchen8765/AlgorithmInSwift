//
//  KnightTour.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/14/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func knightTourPostions(_ n: Int = 8) -> [[Int]]? {
    guard n > 3 else {
        return nil
    }
    
    var solution = [[Int]](repeatElement([Int](repeatElement(0, count: n)), count: n))
    
    var path = 0
    
    func canMove(_ row: Int, _ col: Int) -> Bool {
        if row < n && col < n && row >= 0 && col >= 0 && solution[row][col] == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func moveTo(_ row: Int, _ col: Int, _ step: Int) -> Bool{
        solution[row][col] = path
        path += 1
        
        if step == n * n - 1 {
            return true //done
        }
        
        // go down and right
        if canMove(row + 2, col + 1)
            && moveTo(row + 2, col + 1, step + 1) {
            return true;
        }
        // go right and down
        if canMove(row + 1, col + 2)
            && moveTo(row + 1, col + 2, step + 1) {
            return true;
        }
        // go right and up
        if canMove(row - 1, col + 2)
            && moveTo(row - 1, col + 2, step + 1) {
            return true;
        }
        // go up and right
        if canMove(row - 2, col + 1)
            && moveTo(row - 2, col + 1, step + 1) {
            return true;
        }
        // go up and left
        if canMove(row - 2, col - 1)
            && moveTo(row - 2, col - 1, step + 1) {
            return true;
        }
        // go left and up
        if canMove(row - 1, col - 2)
            && moveTo(row - 1, col - 2, step + 1) {
            return true;
        }
        // go left and down
        if canMove(row + 1, col - 2)
            && moveTo(row + 1, col - 2, step + 1) {
            return true;
        }
        // go down and left
        if canMove(row + 2, col - 1)
            && moveTo(row + 2, col - 1, step + 1) {
            return true;
        }
        
        //back tracking
        path -= 1
        solution[row][col] = 0
        return false
    }
    
    if moveTo(0, 0, 0) {
        return solution
    }
    
    return nil
}
