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
    private var noteTextField: UITextField?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func approvePurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: @escaping (Bool, Error?) -> Void) {
        let alert = UIAlertController(title: NSLocalizedString("noteAlertTitle", comment: ""), message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            self.noteTextField = textField
            self.noteTextField?.placeholder = NSLocalizedString("noteAlertPlaceholderOptional", comment: "")
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("noteAlertButtonCancel", comment: ""), style: .cancel, handler: { (action) in
            completion(false, nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("noteAlertButtonOK", comment: ""), style: .default, handler: { (action) in
            // TODO: Invoke backend
        }))
        viewController.present(alert, animated: true)
    }
    
    func rejectPurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: (Bool, Error?) -> Void) {
        // TODO: Invoke note alert and call backend
    }
    
}
