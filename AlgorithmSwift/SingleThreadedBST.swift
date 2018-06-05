//
//  SingleThreadedBST.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/31/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit

class SingleThreadedBST<T:Comparable>: BinarySearchTree<T> {
    var rightThread = false
    
    override init(value: T) {
        super.init(value: value)
        rightThread = false
    }
    
    override func insert(_ element: T) {
        if element < self.value {
            if let left = self.left {
                left.insert(element)
            }
            else {
                let node = SingleThreadedBST(value: element)
                node.right = self
                node.rightThread = true
                node.parent = self
                self.left = node
            }
        }
        else if element > self.value{
            if let right = self.right {
                right.insert(element)
            }
            else {
                let node = SingleThreadedBST(value: element)
                if self.rightThread {
                    let temp = self.right
                    
                }
            }
        }
    }
}


