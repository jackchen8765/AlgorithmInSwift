//
//  SumDigits.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 6/23/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation



func sumOfDigits(_ number: Int) -> Int {
    var sum = 0
    var n = number
    while n > 0 {
        let reminder = n % 10
        n /= 10
        sum += reminder
    }
    return sum
}


