//
//  LinkedList.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/12/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation



public class ListElement<T:Equatable> {
    var data: T
    var next: ListElement<T>?

    
    init(data: T, next: ListElement<T>?) {
        self.data = data
        self.next = next
    }
}


public class LinkedList<T:Equatable>  : CustomStringConvertible{
    var head: ListElement<T>?
    var tail: ListElement<T>?
    private var count = 0
    
    public var size: Int {
        return count
    }
    
    public var description: String {
        var s = "["
        
        var node = head
        while node != nil {
            s += "\(node!.data)"
            node = node!.next
            if node != nil {
                s += ", "
            }
        }
        return s + "]"
    }
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public func first() ->T? {
        return head?.data
    }
    
    public func last() -> T? {
        return tail?.data
    }
    
    public func append(_ element: T) {
        let node = ListElement(data: element, next: nil)
        count += 1
        if head == nil {
            head = node
        }
        else {
            tail!.next = node
        }
        tail = node
    }
    
    public func preAppend(_ element: T) {
        let node = ListElement(data: element, next: head)
        head = node
        if tail == nil {
            tail = head
        }
        count += 1
    }
    
    public func reverse() {
        if isEmpty()  {
            return
        }
        
        var curr = head
        head = tail
        tail = curr
        var prev: ListElement<T>?
        var next : ListElement<T>? 
        
        while curr != nil {
            next = curr!.next
            curr!.next = prev
            prev = curr
            curr = next
        }
        
        
    }
    
    public func removeFirst() -> T? {
        guard !isEmpty() else {
            return nil
        }
        let data = head!.data
        if tail === head {
            tail = nil
        }
        head = head?.next
        count -= 1
        return data
    }
    
    public func remove(_ element: T) {
        var curr = head
        var prev: ListElement<T>?
        while curr != nil && curr!.data != element {
            prev = curr
            curr = curr!.next
        }
        
        if curr != nil {
            if curr === head {
                head = curr!.next
            }
            else {
                prev!.next = curr!.next
            }
            
            if curr === tail {
                tail = prev
            }
            
            curr = nil
            count -= 1
        }
    }
    
    public func purge() {
        head = nil
        tail = nil
        count = 0
    }

}


