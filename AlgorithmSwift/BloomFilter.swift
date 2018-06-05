//
//  BloomFilter.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct BloomFilter<T> {
    let largePrime = 997
    fileprivate var arrayBits: [Bool] = Array(repeating: false, count: 997)
    fileprivate var hashFunctions: [(T) -> Int]
    
    public init(hashFunctions: [(T)->Int]) {
        self.hashFunctions = hashFunctions
    }
    
    public mutating func insert(_ element: T) {
        for hashValue in calculateHashes(element) {
            arrayBits[hashValue] = true
        }
    }
    
    public func exists(_ element: T) -> Bool {
        let hashValues = calculateHashes(element)
        
        let results = hashValues.map() {
            arrayBits[$0]
        }
        
        let existing = results.reduce(true, {$0 && $1})
            
        return existing
    }
    
    private func calculateHashes(_ element: T) ->[Int] {
        return hashFunctions.map() {
            abs($0(element) % arrayBits.count)
        }
    }
}
