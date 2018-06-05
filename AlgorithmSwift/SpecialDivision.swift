//
//  SpecialDivision.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/13/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


//div two positive integers without using "/"
public func Div(_ a: UInt, _ b: UInt) -> UInt {
    guard b > 0 else {
        fatalError()
    }
    
    var x = a
    
    var result:UInt = 0
    while x >= b {
        let half: UInt = x >> 1
        var m: UInt = 1
        let diff = m * b
        while diff <= half {
            m = m << 1
        }
        result += m
        x -= diff
    }
    return result
}

