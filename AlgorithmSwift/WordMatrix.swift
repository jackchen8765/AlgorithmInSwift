//
//  WordMatrix.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/12/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation


/*
 
 Given a 2D matrix of characters. Check whether the word exist in the matrix or not. If it exists then print its path. All movements are allowed (right, left, up, down and diagonally)
 
 
 ["t", "o", "w", "c", "d"]
 ["a", "h", "n", "z", "x"]
 ["h", "w", "o", "i", "o"]
 ["o", "r", "n", "r", "n"]
 ["a", "b", "r", "i", "n"]
 
 path for "horizon"
 
 [0, 0, 0, 0, 0]
 [0, 1, 0, 5, 0]
 [0, 0, 2, 4, 6]
 [0, 0, 0, 3, 7]
 [0, 0, 0, 0, 0]
 */


func find(word: String, in matrix: [[Character]])->[[Int]]? {
    guard word.count > 0 && matrix.count > 0 && matrix[0].count > 0 else {
        return nil
    }
    
    var result = [[Int]](repeatElement(Array(repeatElement(0, count: matrix[0].count)), count: matrix.count))
    
    var path = 0
    let w = Array(word)
    
    func search(_ w: [Character], _ matrix: [[Character]],
                _ currRow: Int, _ currCol: Int, _ currWordIndex: Int) -> Bool {
        
        if result[currRow][currCol] != 0 || w[currWordIndex] != matrix[currRow][currCol] {
            return false
        }
        
        if currWordIndex == w.count - 1 {
            path += 1
            result[currRow][currCol] = path
            return true
        }
        
        path += 1
        result[currRow][currCol] = path
        
        let m = matrix.count
        let n = matrix[0].count
        
        if currRow + 1 < m && search(w, matrix, currRow + 1, currCol, currWordIndex + 1) {
            return true
        }
        if currCol + 1 < n && search(w, matrix, currRow, currCol + 1, currWordIndex + 1) {
            return true
        }
        if currRow + 1 < m && currCol + 1 < n && search(w, matrix, currRow + 1, currCol + 1, currWordIndex + 1) {
            return true
        }
        if currRow > 0 && search(w, matrix, currRow - 1, currCol, currWordIndex + 1) {
            return true
        }
        if currCol > 0 && search(w, matrix, currRow, currCol - 1, currWordIndex + 1) {
            return true
        }
        if currRow > 0 && currCol > 0 && search(w, matrix, currRow - 1, currCol - 1, currWordIndex + 1) {
            return true
        }
        if currRow + 1 < m && currCol > 0 && search(w, matrix, currRow + 1, currCol - 1, currWordIndex + 1) {
            return true
        }
        if currRow > 0 && currCol + 1 < n && search(w, matrix, currRow - 1, currCol + 1, currWordIndex + 1) {
            return true
        }
        
        //back track
        result[currRow][currCol] = 0
        path -= 1
        return false
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if search(w, matrix, i, j, 0) {
                return result
            }
        }
    }
        
    return nil
}
