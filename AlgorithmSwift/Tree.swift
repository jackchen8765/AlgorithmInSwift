//
//  Tree.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/30/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit


class Tree<T: Equatable> : CustomStringConvertible {
    var value: T
    var parent: Tree?
    var children: [Tree] = []
    
    init(value: T) {
        self.value = value
    }
    
    public var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += "{ \(children.map{$0.description}.joined(separator: ", ")) }"
        }
        return text
    }
    
    func add(child: Tree) {
        self.children.append(child)
    }
    
    func add(children: [Tree]) {
        self.children += children
    }
    
    func search(_ value: T) -> Tree? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}
