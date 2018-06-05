//
//  LRUCache.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 3/28/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

class LRUCache<Key: Hashable, Value> {
    private struct CachePayload {
        let key: Key
        let value: Value
    }
    private let capacity: Int
    
    private let list = DoublyLinkedList<CachePayload>()
    private var nodeDict = [Key: DoublyLinkedListNode<CachePayload>]()
    
    init(capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload(key: key, value: value)
        
        if let node = nodeDict[key] {
            node.payload = payload
            list.moveToHead(node)
        }
        else {
            let node = list.addToHead(payload)
            nodeDict[key] = node
        }
        
        if nodeDict.count > capacity {
            if let lastNode = list.removeLast() {
                nodeDict[lastNode.payload.key] = nil
            }
        }
    }
    
    func getValue(for key: Key) -> Value? {
        if let node = nodeDict[key] {
            list.moveToHead(node)
            return node.payload.value
        }
        else {
            return nil
        }
    }
    
    
}

typealias DoublyLinkedListNode<T> = DoublyLinkedList<T>.Node<T>

class DoublyLinkedList<T> {
    class Node<T> {
        var payload: T
        var prev: Node?
        var next: Node?
        
        init(payload: T) {
            self.payload = payload
        }
    }
    
    private(set) var count = 0
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func addToHead(_ payload: T) -> Node<T>{
        let node = Node(payload: payload)
        
        defer {
            head = node
            count += 1
        }
        
        if let head = head {
            head.prev = node
            node.next = head
        }
        else {
            tail = node
        }
        return node
    }
    
    func moveToHead(_ node: Node<T>) {
        guard node !== head else {
            return
        }
        
        let prevNode = node.prev
        let nextNode = node.next
        
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
        
        node.next = head
        node.prev = nil
        
        if node === tail {
            tail = prevNode
        }
        
        head = node
    }
    
    func removeLast() -> Node<T>?{
        guard let tailNode = tail else {
            return nil
        }
        
        let prevTail = tailNode.prev
        prevTail?.next = nil
        tail = prevTail
        
        if count == 1 {
            head = nil
        }
        
        count -= 1
        return tailNode
    }
}
