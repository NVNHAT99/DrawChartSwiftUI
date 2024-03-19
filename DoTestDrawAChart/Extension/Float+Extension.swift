//
//  Float+Extension.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

extension Float {
    func extractTwoDecimalDigitsStr() -> String {
        return String(format: "%.2f", self)
    }
}
