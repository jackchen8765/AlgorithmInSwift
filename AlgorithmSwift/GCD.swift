//
//  GCD.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r != 0 {
        return gcd(b, r)
    }
    else {
        return b
    }
}
