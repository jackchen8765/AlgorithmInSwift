//
//  PalindromeSubString.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/15/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func longestPalindromeSubstring(_ str: String) -> String {
    guard str.count > 1 else {
        return str
    }
    
    var chars = Array(str)
    let total = chars.count
    var maxPalindromLen = 1
    var maxStart = 0
    var isPalindrome = [[Bool]](repeatElement([Bool](repeatElement(false, count: total)), count: total))
    
    //set palindromes whose length is 1
    for i in 0..<total {
        isPalindrome[i][i] = true
    }
    
    //set palindromes whose lenth is 2
    for i in 0..<total - 1 {
        if chars[i] == chars[i + 1] {
            isPalindrome[i][i + 1] = true
            maxStart = i
            maxPalindromLen = 2
        }
    }
    
    
    //palindromes whose lenght is 3 and above
    if total >= 3 {
        for length in 3...total {
            for i in 0...total - length {
                if chars[i] == chars[i + length - 1] && isPalindrome[i+1][i + length - 2] {
                    isPalindrome[i][i + length - 1] = true
                    maxPalindromLen = length
                    maxStart = i
                }
            }
        }
    }
    
    return String(chars[maxStart...maxStart + maxPalindromLen - 1])
}
