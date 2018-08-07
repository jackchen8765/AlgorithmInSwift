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

public struct Queue1<T> {
    private var stack1 = Stack<T>()
    private var stack2 = Stack<T>()
    
    public mutating func enqueue(_ element: T) {
        stack1.push(element)
    }
    
    public mutating func dequeue() -> T? {
        if !stack2.isEmpty {
            return stack2.pop()
        }
        else {
            while !stack1.isEmpty {
                stack2.push(stack1.pop()!)
            }
            return stack2.pop()
        }
    }
    
    
}

public struct Deque1<T> {
    private var stack1 = Stack<T>()
    private var stack2 = Stack<T>()
    
    public mutating func enqueueAtFront(_ element: T) {
        if !stack2.isEmpty {
            stack2.push(element)
        }
        else {
            while !stack1.isEmpty {
                stack2.push(stack1.pop()!)
            }
            stack2.push(element)
        }
    }
    
    public mutating func enqueueAtBack(_ element: T) {
        stack1.push(element)
    }
    
    public mutating func dequeueAtFront()  -> T? {
        if !stack2.isEmpty {
            return stack2.pop()
        }
        else {
            while !stack1.isEmpty {
                stack2.push(stack1.pop()!)
            }
            return stack2.pop()
        }
    }
    
    public mutating func dequeueAtBack() -> T? {
        if !stack1.isEmpty {
            return stack1.pop()
        }
        else {
            while !stack2.isEmpty {
                stack1.push(stack2.pop()!)
            }
            return stack1.pop()
        }
    }
}
