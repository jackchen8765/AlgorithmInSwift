//
//  StringExtension.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/3/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation


extension String {
    func allSubStrings() -> [[String]] {
        var all = [[String]]()
        
        
        for i in 0..<count {
            var subs = [String]()
            for j in (i+1)...count {
                var letters = [Character]()
                for k in i..<j {
                    let curr = self.index(startIndex, offsetBy: k)
                    letters.append(self[curr])
                }
                subs.append(String(letters))
            }
            all.append(subs)
        }
        
        return all
    }
    
    func toInt(_ base: Int = 10) -> Int? {
        let digits: [Character] = ["0","1","2","3","4","5","6","7","8","9","A","B",
                                   "C","D","E","F","G","H","I","J","K","L","M","N",
                                   "O","P","Q","R","S","T","U","V","W","X","Y","Z"]

        var number = 0
        // some string operations
        /*
        var s = String( s.filter{$0 >= "0" && $0 <= "9"} )
        //s.remove(at: s.startIndex)
        let range = s.index(s.startIndex, offsetBy: 2)...s.index(s.startIndex, offsetBy: 5)
        s = s[range]
        
        for (i,c) in s.enumerated() {
            
            print("index:\(i) char: \(c)")
        } */
        
        let sign = self[self.startIndex]
        var start = startIndex
        var negative = false
        if sign == "-" {
            negative = true
            start = index(after: start)
        }
        
        for i in self.indices[start..<endIndex] {
            if let digit = digits.index(of: self[i]) {
                if digit < base {
                    // Compute the value of the number so far
                    // allowing for overflow
                    let newnumber = number &* base &+ digit
                    
                    // Check for overflow and return nil if
                    // it did overflow
                    if newnumber < number {
                        return nil
                    }
                    number = newnumber
                } else {
                    // Invalid digit for the base
                    return nil
                }
            } else {
                // Invalid character not in digits
                return nil
            }
        }
        return negative ? -number : number
    }
}
