//
//  EnumBST.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/12/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

enum EnumBST<T: Comparable>  : CustomStringConvertible{
    case Empty
    case Leaf(T)
    indirect case Node(EnumBST, T, EnumBST)
    
    
    public var count: Int {
        switch  self {
        case .Empty:
            return 0
        case .Leaf:
            return 1
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty:
            return 0
        case .Leaf:
            return 1
        case .Node(let left, _, let right):
            return 1 + max(left.height, right.height)
        }
    }
    
    public func insert(_ element: T) ->EnumBST {
        switch self {
        case .Empty:
            return .Leaf(element)
        case .Leaf(let value):
            if element < value {
                return .Node(.Leaf(element), value, .Empty)
            }
            else if element > value {
                return .Node(.Empty, value, .Leaf(element))
            }
            else {
                return self
            }
        case .Node(let left, let value, let right):
            if element < value {
                return .Node(left.insert(element), value, right)
            }
            else if element > value {
                return .Node(left, value, right.insert(element))
            }
            else {
                return self
            }
        }
    }
    
    public func search(_ element: T) -> EnumBST? {
        switch self {
        case .Empty:
            return nil
            
        case .Leaf(let value):
            return element == value ? self : nil

        case .Node(let left, let value, let right):
            if element < value {
                return left.search(element)
            }
            else if element > value {
                return right.search(element)
            }
            else {
                return self
            }
        }
    }
    
    public var description: String {
        switch self {
        case .Empty:
            return "."
        case .Leaf(let value):
            return "\(value)"
        case .Node(let left, let value, let right):
            return "\(left.description) <- \(value) -> \(right.description)"
        }
    }
}

