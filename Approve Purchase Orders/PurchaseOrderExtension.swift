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
        var formattedGrossAmount: String?
        if let grossAmount = grossAmount, let currencyCode = currencyCode {
            formattedGrossAmount = Formatter().format(amount: NSNumber(value: grossAmount.doubleValue()), currentCode: currencyCode)
        }
        return formattedGrossAmount
    }
    
}
