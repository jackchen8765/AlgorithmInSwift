//
//  ArrayExtension.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/3/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

extension Array {
    func allSubArray() -> [[Array.Element]] {
        var all = [[Array.Element]]()
        
        for i in 0..<self.count {
            for j in (i+1)...count {
                var inners = [Array.Element]()
                for k in i..<j {
                    inners.append(self[k])
                }
                all.append(inners)
            }
        }
        return all
    }
    
}

func maxSumOfSubArray(_ numbers: [Int]) -> Int {
    let size = numbers.count
    guard size > 2 else {
        return size == 0 ? 0 : numbers[0]
    }
    var sums:[Int] = Array(repeating: 0, count: size + 1)
    
    for i in 1..<sums.count {
        sums[i] = max(sums[i-1] + numbers[i-1], numbers[i-1])
    }
    
    var result = sums[1]
    for i in 2..<sums.count {
        if sums[i] > result {
            result = sums[i]
        }
    }
    return result
}
