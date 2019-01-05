//
//  POActionController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation
import UIKit

class POActionController {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func approvePurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: (Bool, Error?) -> Void) {
        // TODO: Invoke note alert and call backend
    }
    
    func rejectPurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: (Bool, Error?) -> Void) {
        // TODO: Invoke note alert and call backend
    }
    
}
