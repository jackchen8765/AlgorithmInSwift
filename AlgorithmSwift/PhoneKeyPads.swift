//
//  PhoneKeyPads.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/10/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation


func printLettersOfPhoneNumbers(_ numbers: [Int]) {
    let table: [[Character]] = [[" "],
                                [" "],
                                ["A", "B", "C"],
                                ["D", "E", "F"],
                                ["G", "H", "I"],
                                ["J", "K", "L"],
                                ["M", "N", "O"],
                                ["P", "Q", "R", "S"],
                                ["T", "U", "V"],
                                ["W", "X", "Y", "Z"]]
    
    var output = [Character](repeatElement(" ", count: numbers.count))
    
    func printLetters(_ numbers: [Int], _ startIndex: Int) {
        if startIndex == numbers.count {
            print(output)
            return
        }
        
        for c in table[numbers[startIndex]] {
            output[startIndex] = c
            printLetters(numbers, startIndex + 1)
        }
    }
    
    printLetters(numbers, 0)
}
