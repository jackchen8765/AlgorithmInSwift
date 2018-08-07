//
//  Number2Words.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 6/27/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 1234 -> "one thousand two hundred thirty four"
 3045780 -> "three million forty five thousand seven hundre eighty"
 6_110_112_054_103_708_583 -> six quintillion one hundred ten quadrillion one hundred twelve trillion fifty four billion one hundred three million seven hundred eight thousand five hundred eighty three
 */

func number2Words(_ number: UInt) -> String {
    func singleNumberWord (_ digit: UInt) -> String? {
        let table: [UInt : String] = [1: "one",
                                     2: "two",
                                     3: "three",
                                     4: "four",
                                     5: "five",
                                     6: "six",
                                     7: "seven",
                                     8: "eight",
                                     9: "nine"]
        
        
        if digit > 0 && digit < 10 {
            return table[digit]!
        }
        else {
            return nil
        }
    }
    
    func tyNumberWord (_ digit: UInt) -> String? {
        let table: [UInt : String] = [2: "twenty",
                                      3: "thirty",
                                      4: "forty",
                                      5: "fifty",
                                      6: "sixty",
                                      7: "seventy",
                                      8: "eighty",
                                      9: "ninety"]
        
        
        if digit > 1 && digit < 10 {
            return table[digit]!
        }
        else {
            return nil
        }
    }
    
    func teenNumberString (_ digit: UInt) -> String? {
        switch (digit) {
        case 0: return "ten"
        case 1: return "eleven"
        case 2: return "twelve"
        case 3: return "thirteen"
        case 5: return "fifteen"
        case 4,6,7,8:
            if let prefix = singleNumberWord(digit) {
                return prefix + "teen"
            }
            else {
                return nil
            }
        default: return nil
        }
    }
    
    func bigNumberWord(_ digitPlace: UInt) -> String? {
        switch (digitPlace) {
        case 4: return "thousand"
        case 7: return "million"
        case 10: return "billion"
        case 13: return "trillion"
        case 16: return "quadrillion"
        case 19: return "quintillion"
        default: return nil
        }
    }
    
    var n = number
    var digits = [UInt]()
    let base: UInt = 10
    while n != 0 {
        digits.append(n % base)
        n /= base
    }
    
    var plainWords: [String] = []
    
    var isTeen = false
    let totalDigits = digits.count
    var currentPlace = 0
    
    for (index, digit) in digits.reversed().enumerated() {
        currentPlace = totalDigits - index
        if currentPlace % 3 == 0 && digit > 0 { //hundreds
            if let single = singleNumberWord(digit) {
                plainWords.append(single + " hundred")
            }
        }
        else if (currentPlace + 1) % 3 == 0 { //tens
            if digit == 1 {
                isTeen = true
                continue
            } else {
                isTeen = false
                if let ty = tyNumberWord(digit) {
                    plainWords.append(ty)
                }
            }
        }
        else { //singles or teens
            if isTeen {
                if let teen = teenNumberString(digit) {
                    plainWords.append(teen)
                }
                isTeen = false //reset
                
            } else {
                if let single = singleNumberWord(digit) {
                    plainWords.append(single)
                }
            }
        }
        if let bigie = bigNumberWord(UInt(currentPlace)) {
            plainWords.append(bigie)
        }
    }

    return plainWords.joined(separator: " ")
}

