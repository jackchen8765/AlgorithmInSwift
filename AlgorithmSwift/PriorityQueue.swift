//
//  PriorityQueue.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/14/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct PriorityQueue<T: Comparable> {
    fileprivate var heap = [T]()
    fileprivate let ordered: (T, T) -> Bool
    
    public init(ascending: Bool = false, startingValues: [T] = []){
        if ascending {
            ordered = { $0 > $1 }
        }
        else {
            ordered = { $0 < $1 }
        }
        
        heap = startingValues
        var i = heap.count/2 - 1
        while i >= 0 {
            sink(i)
            i -= 1
        }
    }
    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    /// Remove and return the element with the highest
    /// priority (or lowest if ascending). O(log n)
    /// -returns: The element with the highest priority in the
    /// Priority Queue, or nil if the PriorityQueue is empty.
    public mutating func pop() -> T? {
        
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        /// added for Swift 2 compatibility
        /// so as not to call swap() with two instances of
        /// the same location
        swap(&heap[0], &heap[heap.count - 1])
        let temp = heap.removeLast()
        sink(0)
        
        return temp
    }
    
    public mutating func remove(_ item: T) {
        if let index = heap.index(of: item) {
            swap(&heap[index], &heap[heap.count - 1])
            heap.removeLast()
            swim(index)
            sink(index)
        }
    }
    
    /// Get a look at the current highest priority item,
    /// without removing it. O(1)
    /// -returns: The element with the highest priority
    /// in the PriorityQueue, or nil if the PriorityQueue is empty.
    public func peek() -> T? {
        return heap.first
    }
    
    
    
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            
            var j = 2 * index + 1
            
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1])
            {
                j += 1
            }
            if !ordered(heap[index], heap[j])
            {
                break
            }
            
            swap(&heap[index], &heap[j])
            index = j
        }
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index])
        {
            swap(&heap[(index - 1) / 2], &heap[index])
            index = (index - 1) / 2
        }
    }
}

extension PriorityQueue: IteratorProtocol {
    public typealias Element = T
    
    public mutating func next() -> Element? {
        return pop()
    }
}

extension PriorityQueue: Sequence {
    public typealias Iterator = PriorityQueue
    
    public func makeIterator() -> Iterator {
        return self
    }
}

extension PriorityQueue: Collection {
    public typealias Index = Int
    
    public var startIndex: Int {
        return heap.startIndex
    }
    
    public var endIndex: Int {
        return heap.endIndex
    }
    
    public subscript(index: Int) -> T {
        return heap[index]
    }
    
    public func index(after i: PriorityQueue.Index) -> PriorityQueue.Index {
        return heap.index(after: i)
    }
}
    
    
