//
//  PurchaseOrderItemExtension.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 12.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation

extension PurchaseOrderItem {
    
    var formattedPrice: String? {
        guard let price = price, let priceCurrency = priceCurrency else {
            return nil
        }
        return Formatter().format(amount: NSNumber(value: price.doubleValue()), currentCode: priceCurrency)
    }
    
    var formattedGrossAmount: String? {
        guard let grossAmount = grossAmount, let grossAmountCurrency = grossAmountCurrency else {
            return nil
        }
        return Formatter().format(amount: NSNumber(value: grossAmount.doubleValue()), currentCode: grossAmountCurrency)
    }
    
    var formattedQuantity: String? {
        guard let quantity = quantity, let quantityUnit = quantityUnit else {
            return nil
        }
        return Formatter().format(quantity: NSNumber(value: quantity.doubleValue()), quantityUnit: quantityUnit)
    }
    
    var formattedDeliveryDate: String? {
        guard let deliveryDate = deliveryDate else {
            return nil
        }
        return Formatter().format(date: deliveryDate.toDate(), dateStyle: .medium, timeStyle: .none)
    }
    
}
