//
//  StackList.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/14/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


class Node<T> {
    fileprivate var data: T
    public var next: Node?
    
    public init(data: T) {
        self.data = data
        self.next = nil
    }
}

public struct StackList<T> {
    fileprivate var head: Node<T>?
    
    private var _count: Int = 0
    
    public mutating func push(_ element: T) {
        let node = Node<T>(data: element)
        
        node.next = head
        head = node
        _count += 1
    }
    
    public mutating func pop() ->T? {
        if let curr = head {
            let item = curr.data
            _count -= 1
            head = curr.next
            return item
        }
        return nil
    }
    
    public func peek() -> T? {
        return head?.data
    }
}
