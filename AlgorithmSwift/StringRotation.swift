//
//  StringRotation.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/10/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func isRotated(_ str1: String, _ str2: String) -> Bool {
    
    guard str1.count == str2.count else {
        return false
    }
    
    let doubleStr1 = str1 + str1
    if doubleStr1.contains(str2) {
        return true
    }
    else {
        return false
    }
    
}
