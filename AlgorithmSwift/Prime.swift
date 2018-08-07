//
//  Prime.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

func firstPrimes(_ n: Int) -> [Int] {
    var m = n
    var primes = [Int]()
    
    for d in 2...m {
        while m % d == 0 {
            primes.append(d)
            m /= d
        }
    }
    
    return primes
}



func isPrime( _ n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    else if n <= 3 {
        return true
    }
    
    var i = 2
    while i * i <= n {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    return true
}
