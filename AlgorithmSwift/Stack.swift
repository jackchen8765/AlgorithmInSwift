//
//  Stack.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/8/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation



public struct Stack<T> {
    fileprivate var data = [T]()
    
   
    
    public var isEmpty: Bool {
        return data.isEmpty
    }
    
    public var count: Int {
        return data.count
    }
    
    public mutating func push(_ element: T) {
        data.append(element)
    }
    
    public mutating func pop() -> T? {
        return data.popLast()
    }
    
    
    public func peek() -> T? {
        return data.last
    }
}

struct Stack1<T> {
    var data = [T]()
    
    public mutating func push(_ element: T) {
        data.append(element)
        
    }
    
    public mutating func pop() ->T? {
        return data.popLast()
    }
    
    public func peek() -> T? {
        return data.last
    }
}

extension Stack1 : CustomStringConvertible {
    public var description: String {
        return data.description
    }
}

extension Stack1 : ExpressibleByArrayLiteral {
    public init(arrayLiteral: T...) {
        for element in arrayLiteral {
            data.append(element)
        }
    }
}

extension Stack {
    public mutating func leak() -> T? {
        if count > 1 {
            //swap bottom with top
            swap(&data[0], &data[count - 1])
        }
        let element = pop()
        if count > 1 {
            //swap back
            swap(&data[0], &data[count-1])
        }
        return element
    }
}

public struct Deque<T> {
    fileprivate var frontStack = Stack<T>()
    fileprivate var backStack = Stack<T>()
    
    public mutating func enqueueAtFront(_ element: T) {
        frontStack.push(element)
    }
    public mutating func enqueueAtBack(_ element: T) {
        backStack.push(element)
    }
    
    public mutating func dequeueAtFront() -> T? {
        if !frontStack.isEmpty {
            return frontStack.pop()
        }
        else if !backStack.isEmpty {
            return backStack.leak()
        }
        else {
            return nil
        }
    }
    
    public mutating func dequeueAtBack() -> T? {
        if !backStack.isEmpty {
            return backStack.pop()
        }
        else if !frontStack.isEmpty {
            return frontStack.leak()
        }
        else {
            return nil
        }
    }
}

extension Stack : CustomStringConvertible {
    public var description: String {
        return self.data.description
    }
}

extension Stack: ExpressibleByArrayLiteral {
     public init(arrayLiteral: T...) {
        self.init()
        
        for element in arrayLiteral {
            self.data.append(element)
        }
    }
}




