//
// CollectionType.swift
// Approve Purchase Orders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/01/19
//

import Foundation

enum CollectionType: String {
    case suppliers = "Suppliers"
    case purchaseOrderItems = "PurchaseOrderItems"
    case purchaseOrders = "PurchaseOrders"
    case none = ""

    static let all = [
        suppliers, purchaseOrderItems, purchaseOrders,
    ]
}
