//
//  Shuffle.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/18/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


extension Array{
    public mutating func shuffle() {
        for i in stride(from: count - 1, through: 1, by: -1) {
            let j = Int(arc4random_uniform(UInt32(i+1)))
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}
