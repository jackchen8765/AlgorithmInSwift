//
//  Heap.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/17/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


public struct Heap<T> {
    fileprivate var elements: [T]
    fileprivate var priorityFunction: (T, T) -> Bool
    
    init(elements: [T] = [], priorityFunction: @escaping(T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        
        buildHeap()
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public func peek() -> T? {
        return elements.first
    }
    
    public mutating func enqueue(_ element: T) {
        elements.append(element)
        swimUpElement(at: count - 1)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            swimDownElement(at: 0)
        }
        return element
    }
    
    private func isRoot( _ index: Int) -> Bool {
        return index == 0
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1)/2
    }
    
    private mutating func buildHeap() {
        for index in (0..<count/2).reversed() {
            swimDownElement(at: index)
        }
    }
    
    
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    private func highestParentChildrenIndex(at parent: Int) -> Int {
        let left = leftChildIndex(of: parent)
        let right = rightChildIndex(of: parent)
        if left < count {
            let higher = isHigherPriority(at: parent, than: left) ? parent : left
            if right < count {
                return isHigherPriority(at: higher, than: right) ? higher: right
            }
            else {
                return higher
            }
        }
        else {
            return parent
        }
    }
    
    private mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        if firstIndex != secondIndex {
            swap(&elements[firstIndex], &elements[secondIndex])
        }
    }
    
    private mutating func swimUpElement(at index: Int) {
        if isRoot(index) {
            return
        }
        let next = parentIndex(of: index)
        if isHigherPriority(at: index, than: next) {
            swapElement(at: index, with: next)
            swimUpElement(at: next)
        }
    }
    
    private mutating func swimDownElement(at index: Int) {
        let next = highestParentChildrenIndex(at: index)
        if next == index {
            return
        }
        swapElement(at: index, with: next)
        swimDownElement(at: next)
    }
}
