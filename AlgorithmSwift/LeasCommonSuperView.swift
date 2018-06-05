//
//  LeasCommonSuperView.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/28/18.
//  Copyright © 2018 clz. All rights reserved.
//

import UIKit

func leastCommonSuperview(_ view1: UIView, _ view2: UIView) -> UIView? {
    var dict = [UIView : Bool]()
    var curr1 : UIView? = view1
    var curr2 : UIView? = view2
    while curr1 != nil && curr2 != nil {
        if let _ = dict[curr1!]  {
            return curr1
        }
        else {
            dict[curr1!] = true
        }
        if let _ = dict[curr2!] {
            return curr2
        }
        else {
            dict[curr2!] = true
        }
        curr1 = curr1!.superview
        curr2 = curr2!.superview
    }
    if curr1 == nil && curr2 == nil {
        return nil
    }
    else if curr2 != nil {
        curr1 = curr2
    }
    
    while curr1 != nil {
        if let _ = dict[curr1!] {
            return curr1
        }
        curr1 = curr1!.superview
    }
    
    return nil
}


