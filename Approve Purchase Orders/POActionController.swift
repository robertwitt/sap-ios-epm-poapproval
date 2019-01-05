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
    private var noteAlert: UIAlertController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func approvePurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: @escaping (Bool, Error?) -> Void) {
        prepareNoteAlert(mandatory: false, cancelHandler: { (action) in
            completion(false, nil)
        }, okHandler: { (action) in
            // TODO: Invoke backend
        })
        viewController.present(noteAlert!, animated: true)
    }
    
    func rejectPurchaseOrder(_ purchaseOrder: PurchaseOrder, completion: @escaping (Bool, Error?) -> Void) {
        prepareNoteAlert(mandatory: true, cancelHandler: { (action) in
            completion(false, nil)
        }, okHandler: { (action) in
            // TODO: Invoke backend
        })
        viewController.present(noteAlert!, animated: true)
    }
    
    private func prepareNoteAlert(mandatory: Bool, cancelHandler: @escaping (UIAlertAction) -> Void, okHandler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: NSLocalizedString("noteAlertTitle", comment: ""), message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = mandatory ? NSLocalizedString("noteAlertPlaceholderMandatory", comment: "") : NSLocalizedString("noteAlertPlaceholderOptional", comment: "")
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("noteAlertButtonCancel", comment: ""), style: .cancel, handler: cancelHandler))
        
        let okAction = UIAlertAction(title: NSLocalizedString("noteAlertButtonOK", comment: ""), style: .default, handler: okHandler)
        okAction.isEnabled = !mandatory
        alert.addAction(okAction)
        
        noteAlert = alert
    }
    
}
