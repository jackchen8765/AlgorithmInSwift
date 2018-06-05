//
//  MovingAnts.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/11/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation


enum Direction: Int {
    case left = -1
    case right = 1
}

class Ant: CustomStringConvertible {
    var position: Int
    var direction: Direction
    var isOut: Bool {
        return position == 0 || position == 27
    }
    
    var description: String {
        let dir = direction == .left ? "left" : "right"
        return ("position: \(position), direction: \(dir) ")
    }
    
    init(position: Int, direction: Direction) {
        self.position = position
        self.direction = direction
    }
    
    func move() {
        if !isOut {
            position += direction.rawValue
        }
    }
    
    func nextPosition() -> Int {
        return position + direction.rawValue
    }
    
    
    
}



class AntGame {
    var ants: [Ant]
    var fieldLength: Int
    
    var mark = Array<Array<Ant>>()
    
    init(ants: [Ant], fieldLength: Int) {
        self.ants = ants
        self.fieldLength = fieldLength
        mark = Array<Array<Ant>>(repeating: Array<Ant>(), count: fieldLength)
        for ant in ants {
            mark[ant.position].append(ant)
        }
    }
    
    func updatePositions() {
        
    }
    
    func gameTime() -> Int {
        var totalTime = 0
        var totalOut = 0
        let totalAnts = ants.count
        
        for ant in ants {
            if ant.isOut {
                totalOut += 1
            }
        }
        
        while totalOut != totalAnts {
            for ant in ants {
                ant.move()

                if ant.isOut {
                    totalOut += 1
                }
            }
            totalTime += 1
            updatePositions()
        }
        return totalTime
    }
    
}

