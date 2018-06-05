//
//  EnumList.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/12/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


enum EnumList<T: Comparable> {
    case End
    indirect case Node(T, next: EnumList)
    
    public var count: Int {
        switch self {
        case .End:
            return 0
        
        case .Node (_, let next):
            return 1 + next.count
        }
    }
}


extension EnumList {
    public func cons(_ element: T) ->EnumList<T> {
        return .Node(element, next:self)
    }
}

extension EnumList {
    mutating func push(_ x: T) {
        self = self.cons(x)
    }
    
    mutating func pop() -> T? {
        switch self {
        case .End: return nil
        case .Node(let x, let xs):
            self = xs
            return x
        }
    }
}
