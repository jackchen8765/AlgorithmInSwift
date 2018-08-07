//
//  EggDrop.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 4/2/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 The following is a description of the instance of this famous puzzle involving n=2 eggs and a building with k=36 floors.
 
 Suppose that we wish to know which stories in a 36-story building are safe to drop eggs from, and which will cause the eggs to break on landing. We make a few assumptions:
 
 …..An egg that survives a fall can be used again.
 …..A broken egg must be discarded.
 …..The effect of a fall is the same for all eggs.
 …..If an egg breaks when dropped, then it would break if dropped from a higher floor.
 …..If an egg survives a fall then it would survive a shorter fall.
 …..It is not ruled out that the first-floor windows break eggs, nor is it ruled out that the 36th-floor do not cause an egg to break.
 
 If only one egg is available and we wish to be sure of obtaining the right result, the experiment can be carried out in only one way. Drop the egg from the first-floor window; if it survives, drop it from the second floor window. Continue upward until it breaks. In the worst case, this method may require 36 droppings. Suppose 2 eggs are available. What is the least number of egg-droppings that is guaranteed to work in all cases?
 The problem is not actually to find the critical floor, but merely to decide floors from which eggs should be dropped so that total number of trials are minimized.
 
 When we drop an egg from a floor x, there can be two cases (1) The egg breaks (2) The egg doesn’t break.
 
 1) If the egg breaks after dropping from xth floor, then we only need to check for floors lower than x with remaining eggs; so the problem reduces to x-1 floors and n-1 eggs
 2) If the egg doesn’t break after dropping from the xth floor, then we only need to check for floors higher than x; so the problem reduces to k-x floors and n eggs.
 
 Since we need to minimize the number of trials in worst case, we take the maximum of two cases. We consider the max of above two cases for every floor and choose the floor which yields minimum number of trials.
 
 k ==> Number of floors
 n ==> Number of Eggs
 eggDrop(n, k) ==> Minimum number of trials needed to find the critical
 floor in worst case.
 eggDrop(n, k) = 1 + min{max(eggDrop(n - 1, x - 1), eggDrop(n, k - x)):
 x in {1, 2, ..., k}}
 
 
 */

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
