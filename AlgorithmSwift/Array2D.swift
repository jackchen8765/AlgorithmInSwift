//
//  Array2D.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/17/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct Array2D<T> {
    let columns: Int
    let rows: Int
    
    fileprivate var array: [T]
    
    public init(columns: Int, rows: Int, initValue: T) {
        self.columns = columns
        self.rows = rows
        array = [T](repeatElement(initValue, count: rows * columns))
    }
    
    public subscript(column: Int, row: Int) ->T {
        get {
            return array[row * self.columns + column]
        }
        
        set {
            array[row * columns + column] = newValue
        }
    }
}

extension Array {
    var powerset: [[Element]] {
        guard count > 0 else {
            return [[]]
        }
        
        // tail contains the whole array BUT the first element
        let tail = Array(self[1..<endIndex])
        
        // head contains only the first element
        let head = self[0]
        
        // computing the tail's powerset
        let withoutHead = tail.powerset
        
        // mergin the head with the tail's powerset
        let withHead = withoutHead.map { $0 + [head] }
        
        // returning the tail's powerset and the just computed withHead array
        return withHead + withoutHead
    }
}

