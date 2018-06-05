//
//  CircularBuffer.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/13/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


public struct CircularBuffer<T> {
    fileprivate var data: [T]
    fileprivate var readIndex: Int = 0, writeIndex : Int = 0
    
    
    private var internalCount: Int = 0
    
    public init(capacity: Int, initValue: T) {
        data = [T](repeatElement(initValue, count: capacity))
    }
    
    public var isEmpty: Bool {
        return readIndex == writeIndex
    }
    
    public var isFull: Bool {
        return data.count - (writeIndex - readIndex) == 0
    }
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            data[writeIndex % data.count] = element
            writeIndex += 1
            return true
        }
        return false
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = data[readIndex % data.count]
            readIndex += 1
            return element
        }
        return nil
    }
}
