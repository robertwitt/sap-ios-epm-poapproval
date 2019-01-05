//
//  Formatter.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation

class Formatter {
    
    func format(amount: NSNumber, currentCode: String) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.currencyCode = currentCode
        return formatter.string(from: amount)
    }
    
    func format(date: Date) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        
        guard let timeString = formatter.string(from: date, to: Date()) else {
            return nil
        }
        return String(format: NSLocalizedString("formattedTimeAgo", comment: ""), timeString)
    }
    
}
