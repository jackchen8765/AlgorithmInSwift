//
//  LinkedListQueue.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/1/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit

class LinkedListQueue<T:Equatable> {
    var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty()
    }
    
    var size: Int {
        return list.size
    }
    
    func enque(_ element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        return list.removeFirst()
    }
    
    
}
