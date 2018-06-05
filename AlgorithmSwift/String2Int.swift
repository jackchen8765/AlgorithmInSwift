//
//  String2Int.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import UIKit

func str2Int(_ s: String, _ base: Int) -> Int? {
    let digits: [Character] = ["0","1","2","3","4","5","6","7","8","9","A","B",
                               "C","D","E","F","G","H","I","J","K","L","M","N",
                               "O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    


    
    var number = 0
    //some string operations
    /*
    var s = String( s.filter{$0 >= "0" && $0 <= "9"} )
    //s.remove(at: s.startIndex)
    let range = s.index(s.startIndex, offsetBy: 2)...s.index(s.startIndex, offsetBy: 5)
    s = s[range]

    for (i,c) in s.enumerated() {

        print("index:\(i) char: \(c)")
    }
     */
    
    for char in s {
        if let digit = digits.index(of: char) {
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
    return number
}


