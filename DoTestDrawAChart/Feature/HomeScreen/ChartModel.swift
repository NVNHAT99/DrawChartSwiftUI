//
//  ChartModel.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

// MARK: - Welcome
struct EnergyUsageHistory: Codable {
    let address: String?
    let from, to: String?
    let usageHistories: [DailyUsageHistory]
    let approxTotalCost, approxTotalElectricity, currentTotalCost, currentTotalElectricity: Int?
    
    var maxEnergyDailyUse: Float {
        return usageHistories.max(by: {($0.consumption ?? 0) < ($1.consumption ?? 0)})?.consumption ?? 0
    }
    
    var avgDailyUsage: Float {
        let numbers = usageHistories.compactMap({ $0.cost })
        let sum = numbers.reduce(0, +)
        return numbers.isEmpty ? 0 : sum / Float(numbers.count)
    }
    
    var avgDailyConsumption: Float {
        let numbers = usageHistories.compactMap({ $0.consumption })
        let sum = numbers.reduce(0, +)
        return numbers.isEmpty ? 0 : sum / Float(numbers.count)
    }
    
    var totalCost: Float {
        return usageHistories.reduce(0) { $0 + ($1.cost ?? 0) }
    }
    
    var totalConsumption: Int {
        return Int(usageHistories.reduce(0) { $0 + ($1.consumption ?? 0) })
    }
}

// MARK: - UsageHistory
struct DailyUsageHistory: Codable, Hashable {
    let date: String?
    let cost, consumption: Float?
    
    func heightOfColumn(_ maxColumnValue: Float) -> CGFloat {
        if maxColumnValue == 0 {
            return 0
        } else {
            return CGFloat(((consumption ?? 0) / maxColumnValue) * 100)
        }
    }
}
