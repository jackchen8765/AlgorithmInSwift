//
//  MaxStockProfit.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/30/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

// prices: [200.0, 500.0, 1000.0, 700.0, 30.0, 400.0, 900.0, 400.0, 50.0]
func maxProfit(_ prices: [Double]) -> (profit: Double, buyDateIndex: Int, sellDateIndex: Int)? {
    guard prices.count > 1 else {
        return nil
    }
    var maxSellPrice = prices.last!
    var maxProfit = maxSellPrice - prices[0]
    var buyDateIndex = 0
    var sellDateIndex = prices.count - 1
    var tempIndex = sellDateIndex
    
    for i in stride(from: prices.count - 2, through: 0, by: -1) {
        if maxSellPrice < prices[i] {
            maxSellPrice = prices[i]
            tempIndex = i
        }
        else if maxSellPrice > prices[i] {
            let profit = maxSellPrice - prices[i]
            if maxProfit < profit {
                maxProfit = profit
                buyDateIndex = i
                sellDateIndex = tempIndex
            }
        }
    }
    return (maxProfit, buyDateIndex, sellDateIndex)
}
