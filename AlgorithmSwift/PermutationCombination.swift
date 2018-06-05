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

//let letters = ["a", "b", "c", "d", "e"]
//permuteWirth(letters, letters.count - 1)
//["a", "b", "c", "d", "e"]
//["b", "a", "c", "d", "e"]
//["b", "c", "a", "d", "e"]
//["a", "c", "b", "d", "e"]
//...

func permuteWorth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)
    }
    
    var a = a
    permuteWorth(a, n-1)
    
    for i in 0..<a.count {
        swap(&a[i], &a[n])
        permuteWorth(a, n-1)
        swap(&a[i], &a[n])
    }
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
