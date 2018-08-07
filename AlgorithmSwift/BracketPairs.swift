//
//  BracketPairs.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/7/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Print all possible combination of n pairs of open "{" and close "}"
 For example, when n = 1, it would be "{}"
 
 when n = 2, it would be "{}{}" "{{}}"
 
 */

func printBracketPairs(of n: Int) {
    
    func printBrackets(_ openBrackets: Int, _ closeBrackets: Int, _ pairs: String) {
        if openBrackets == 0 && closeBrackets == 0 {
            print(pairs)
            return
        }
        
        //make sure there was already an open bracket for each close bracket
        if openBrackets > closeBrackets {
            return
        }
        
        if openBrackets > 0 {
            
            printBrackets(openBrackets - 1, closeBrackets, pairs + "{")
        }
        
        if closeBrackets > 0 {
            printBrackets(openBrackets, closeBrackets - 1, pairs + "}")
        }
        
    }
    
    guard n > 0 else {
        return
    }
    
    var str = ""
    printBrackets(n, n, str)
}


