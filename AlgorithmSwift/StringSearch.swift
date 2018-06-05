//
//  StringSearch.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/17/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

extension String {
    /*
    //brutal force string search
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.characters.indices {
            var j = i
            var found = true
            
            for p in pattern.characters.indices {
                if j == self.characters.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                }
                else {
                    j = self.characters.index(after: j)
                }
            }
            if found {
                return i
            }
            
        }
        return nil
    } 
    */
    
    //Boyer Moore String Search
    func indexOf(_ pattern: String) ->Index? {
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= count else {
            return nil
        }
        
        var skipTable = [Character : Int]()
        
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        func backwords() -> Index? {
            var q = p
            var j = i
            while q > pattern.startIndex {
                j = index(before:  j)
                q = index(before: q)
                if self[j] != pattern[q] {
                    return nil
                }
            }
            return j
        }
        
        while i < endIndex {
            let c = self[i]
            if c == lastChar {
                if let k = backwords() {
                    return k
                }
                i = index(after: i)
            }
            else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
    
    func isPalindrom() -> Bool {
        var i = self.startIndex
        var j = self.index(before: self.endIndex)
        
        while i < j {
            if self[i] != self[j] {
                return false
            }
            i = self.index(after: i)
            j = self.index(before: j)
        }
        return true
    }
}
