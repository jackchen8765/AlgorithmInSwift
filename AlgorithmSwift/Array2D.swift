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

