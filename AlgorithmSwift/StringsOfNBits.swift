//
//  StringsOfNBits.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/8/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 
 Objec­tive: – Generate All Strings of n bits, consider A[0..n-1] is an array of size n.
 n = 3
 Output:
 [0, 0, 0]    [1, 0, 0]    [0, 1, 0]    [1, 1, 0]
 
 [0, 0, 1]     [1, 0, 1]     [0, 1, 1]    [1, 1, 1]
 
 */

func printStringsOfNBits(_ n: Int) {
    var a = [Int](repeatElement(0, count: n))
    
    func printStringBits(_ n : Int) {
        if n <= 0 {
            print(a)
        }
        else {
            a[n - 1] = 0
            printStringBits(n - 1)
            a[n - 1] = 1
            printStringBits(n - 1)
        }
    }
    
    printStringBits(n)
}
