//
//  String+Extension.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

extension String {
    func toDate(_ dateFormat: String = "d MMM yyyy") -> String {
        if isEmpty {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    func floatValue() -> Float? {
        return Float(self)
    }
    
    func intValue() -> String {
        guard let floatValue = Float(self) else {
            return ""
        }
        return String(Int(floatValue))
    }
}
