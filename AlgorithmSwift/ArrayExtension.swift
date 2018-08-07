//
//  ArrayExtension.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/3/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

extension Array {
    //input: [1, 2, 3]
    //output: [[1], [1,2], [1,2,3], [2], [2,3], [3]]
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
    
    var powerset: [[Array.Element]] {
        guard count > 0 else {
            return [[]]
        }
        /*
        // tail contains the whole array BUT the first element
        let tail = Array(self[1..<endIndex])
        
        // head contains only the first element
        let head = self[0]
        
        // computing the tail's powerset
        let withoutHead = tail.powerset
        
        // merging the head with the tail's powerset
        let withHead = withoutHead.map { [head] + $0}
        
        // returning the tail's powerset and the just computed withHead array
        return withHead + withoutHead
        */
        
        //head contains the whole array but the last element
        let head = Array(self[0..<endIndex].dropLast())
        
        //tail contains only the last element
        let tail = self[count - 1]
        
        //computing the head power set
        let headPowerset = head.powerset
        
        //computing the tail power set
        let tailPowerset = headPowerset.map { $0 + [tail] }
        
        //returning the combined
        return headPowerset + tailPowerset
    }
    
}


//example input: [1, 2, -1, 3, 5, -3, 6]
//output: 13
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
