//
//  RangeProblem.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/29/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit


extension Range {
    public func intersect(_ other: Range) -> Range {
        guard upperBound > other.lowerBound else {
            return upperBound..<upperBound
        }
        guard other.upperBound > lowerBound else {
            return lowerBound..<lowerBound
        }
        let start = other.lowerBound > lowerBound ? other.lowerBound : lowerBound
        let end = other.upperBound < upperBound ? other.upperBound : upperBound
        return start..<end
    }
}
