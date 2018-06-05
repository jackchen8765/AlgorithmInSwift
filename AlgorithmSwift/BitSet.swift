//
//  BitSet.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/17/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


public struct BitSet {
    public typealias Word = UInt64
    
    private(set) public var size: Int
    private(set) public var words: [Word]
    
    private let N = 64
    
    
    public init(size: Int) {
        self.size = size
        let n = (size + (N-1))/N
        words = [Word](repeating: 0, count: n)
    }
    
    static func setBitsCount(_ num: Int) -> Int {
        var num = num
        var count = 0;
        
        while num != 0 {
            num &= num - 1
            count += 1
        }
        return count
    }
    
    public mutating func set(_ i: Int) {
        let (index, mask) = indexOf(i)
        words[index] |= mask
    }
    
    public mutating func clear(_ i: Int) {
        let (index, mask) = indexOf(i)
        words[index] &= ~mask
    }
    
    public func isSet(_ i: Int) -> Bool {
        let (index, mask) = indexOf(i)
        return (words[index] & mask) != 0
    }
    
    public subscript(index: Int) -> Bool {
        get {
            return isSet(index)
        }
        
        set {
            if newValue {
                set(index)
            }
            else {
                clear(index)
            }
        }
    }

    
    
    private func indexOf(_ i: Int) -> (Int, Word) {
        let index = i / N
        let bit = Word(i - index * N)
        return (index, 1 << bit)
    }
    
    
}


