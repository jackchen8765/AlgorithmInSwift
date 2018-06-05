//
//  HashTable.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/18/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct HashTable<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    
    private (set) public var count = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    public subscript(key: Key) ->Value? {
        get {
            return self.value(forKey: key)
        }
        
        set {
            if let value = newValue {
                _ = self.updateValue(value, forKey: key)
            }
            else {
                _ = self.removeValue(forKey: key)
            }
        }
    }
    
    public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index].remove(at: i)
                count -= 1
                return oldValue
            }
        }
        return nil
    }
    
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
}

struct HashTable1<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    private (set) public var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    init(capacity: Int) {
        assert(capacity > 0)
        
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    subscript(key: Key) -> Value? {
        get {
            return self.value(forKey: key)
        }
        
        set {
            if let value = newValue {
                _ = self.updateValue(value, forKey: key)
            }
            else {
                _ = self.removeValue(forKey: key)
            }
        }
    }
    
    mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index].remove(at: i)
                count -= 1
                return oldValue
            }
        }
        return nil
    }
    
}
