//
//  HanoiTower.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/2/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit

/*
 
 The Tower of Hanoi is a mathematical game or puzzle. It consists of three rods, and a number of disks of different sizes which can slide onto any rod.
 
 The objective of the puzzle is to move the entire stack to another rod, obeying the following simple rules:
 
 Only one disk is allowed to move at a time..
 Bigger disk cannot be placed on the top of smaller disk.
 
 Approach:
 
 Recursively Move N-1 disk from source to Auxiliary rod.
 Move the last disk from source to destination.
 Recursively Move N-1 disk from Auxiliary to destination rod.
 */


func hanoiTower(_ n: Int, source: String, aux: String, dest: String) {
    if n == 1 {
        print("Move disk \(n) from \(source) to \(dest)")
    }
    else {
        hanoiTower(n-1, source: source, aux: dest, dest: aux)
        print("Move disk \(n) from \(source) to \(dest)")
        hanoiTower(n-1, source: aux, aux: source, dest: dest)
    }
}
