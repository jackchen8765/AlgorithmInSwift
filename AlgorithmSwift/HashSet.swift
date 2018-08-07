//
//  HashSet.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/18/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct HashSet<T:Hashable> {
    public typealias Element = T

    fileprivate var dict = Dictionary<T, Bool>()
    
    public mutating func insert(_ element: T) {
        dict[element] = true
    }
    
    public mutating func remove(_ element: T) {
        dict[element] = nil
    }
    
    public func allElements() -> [T] {
        return Array(self.dict.keys)
    }
    
    public func union(_ otherSet: HashSet<T>) -> HashSet<T> {
        var combined = HashSet<T>()
        
        for obj in self.allElements() {
            combined.insert(obj)
        }
        
        for obj in otherSet.allElements() {
            combined.insert(obj)
        }
        return combined
    }
    
  
}

public struct HashSet1<T: Hashable> {
    typealias Element = T
    var dict = Dictionary<T, Bool>()
    
    mutating func insert(_ element: T) {
        dict[element] = true
    }
    
    mutating func remove(_ element: T) {
        dict[element] = nil
    }
    
    func allElements() -> [T] {
        return Array(dict.keys)
    }
    
    func union(_ otherSet: HashSet<T>) -> HashSet<T> {
        var combined = HashSet<T>()
        
        for obj in self.allElements() {
            combined.insert(obj)
        }
        
        for obj in otherSet.allElements() {
            combined.insert(obj)
        }
        return combined
    }

}
