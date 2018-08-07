//
//  PermutationCombination.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/18/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

//n! = n*(n-1)(n-2)..1
func  factorial( _ n : Int) -> Int {
    var n = n
    
    var result = 1
    while n > 1
    {
        result *= n
        n -= 1
    }
    return result
}


//P(n,k) = n!/(n-k)! = n*(n-1)..(n-k+1)
func permutation( _ n : Int, _ k: Int) -> Int {
    var n = n
    var result = n
    
    for _ in 1..<k {
        n -= 1
        result *= n
    }
    return result
}

/*
 let letters = "abcd"
 return:
 
["dabc", "dacb", "dbca", "dbac",
 "dbac", "dbca", "abdc", "abcd",
 "adcb", "adbc", "adbc", "adcb",
 "acbd", "acdb", "abdc", "abcd",
 "abcd", "abdc", "adbc", "adcb",
 "abcd", "abdc", "abdc", "abcd"]
 */


func permutations(_ str: String) -> [String] {
    var result = [String]()
    
    var chars = Array(str)
    
    func permulate(_ a: [Character], _ left: Int, _ size: Int) {
        if left == size {
            result.append(String(a))
            return
        }
        var a = a
        for i in left..<size {
            a.swapAt(i, size - 1)
           
            permulate(a, left + 1, size)
            
            a.swapAt(i, size - 1)
        }
    }
    permulate(chars, 0, chars.count)
    return result
}


// C(n,k) = n!/((n-k)!k!) = P(n,k)/k!

func combination( _ n: Int, _ k : Int) -> Int {
    return permutation(n, k)/factorial(k)
}

//C(n,k) = (n-0)*(n-1)*(n-k+1)/(0+1)*(1+1)*(k-1+1)

func fastCombination(_ n : Int, _ k: Int) -> Int {
    var result = 1
    for i in 0..<k {
        result *= (n - i)
        result /= (i + 1)
    }
    return result
}
