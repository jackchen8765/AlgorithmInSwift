//
//  Queue.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/13/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        }
        else {
            return array.removeFirst()
        }
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func removeAll() {
        array.removeAll()
    }

}
