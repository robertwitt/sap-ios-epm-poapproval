//
//  PurchaseOrderExtension.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation

extension PurchaseOrder {
    
    var formattedGrossAmount: String? {
        guard let grossAmount = grossAmount, let currencyCode = currencyCode else {
            return nil
        }
        return Formatter().format(amount: NSNumber(value: grossAmount.doubleValue()), currentCode: currencyCode)
    }
    
    var formattedChangedAt: String? {
        guard let changedAt = changedAt else {
            return nil
        }
        return Formatter().format(date: changedAt.toDate())
    }
    
}
