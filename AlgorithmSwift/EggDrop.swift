//
//  EggDrop.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 4/2/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func eggDrop(numberOfEggs: Int, numberOfFloors: Int) -> Int {
    if numberOfEggs == 0 || numberOfFloors == 0 {
        return 0
    }
    
    if numberOfEggs == 1  {
        return numberOfFloors
    }
    
    var eggFloor = [[Int]](repeatElement([Int](repeatElement(0, count: numberOfFloors + 1)), count: numberOfEggs + 1))
    
    var attempts: Int = 0
    
    for floorNumber in (0..<numberOfFloors+1) {
        eggFloor[1][floorNumber] = floorNumber
    }
    
    eggFloor[2][1] = 1 //if there are 2 eggs and 1 floor, it takes one attempt
    
    for eggNumber in 2..<numberOfEggs+1 {
        for floorNumber in 2..<numberOfFloors+1 {
            eggFloor[eggNumber][floorNumber] = Int.max
            for visitingFloor in 1..<floorNumber+1 {
                //there are two cases
                //case 1: egg breaks. meaning we'll have one less egg, and we'll have to go downstairs -> visitingFloor-1
                //case 2: egg doesn't break. meaning we'll still have 'eggs' number of eggs, and we'll go upstairs -> floorNumber-visitingFloor
                //we add one taking into account the attempt we're taking at the moment
                attempts = 1 + max(eggFloor[eggNumber - 1][visitingFloor - 1], eggFloor[eggNumber][floorNumber - visitingFloor])
                
                if attempts < eggFloor[eggNumber][floorNumber] {
                    eggFloor[eggNumber][floorNumber] = attempts
                }
            }
        }
    }
    
    
    return eggFloor[numberOfEggs][numberOfFloors]
}
