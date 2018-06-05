//
//  Memoizations.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/30/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit


func memoizedFib(_ n: Int, _ mem: inout [Int : Int]) -> Int {
    if let fib = mem[n] {
        return fib
    }
    
    if n <= 2 {
        return 1
    }
    else {
        let fib = memoizedFib(n-1, &mem) + memoizedFib(n-2, &mem)
        mem[n] = fib
        return fib
    }
}
