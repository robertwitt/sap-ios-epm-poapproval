//
//  ViewControllerExtension.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPOData

extension UIViewController {
    
    var presentedInSplitView: Bool {
        return !(splitViewController?.isCollapsed ?? true)
    }
    
    var dataService: EPMREFAPPSPOAPVSRVEntities<OnlineODataProvider> {
        return (UIApplication.shared.delegate as! AppDelegate).epmrefappspoapvsrvEntities
    }
    
    func showAlert(withError error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("errorAlertTitle", comment: ""),
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("alertButtonOK", comment: ""), style: .default))
        present(alert, animated: true)
    }
    
    func showAlert(withMessage message: String) {
        let alert = UIAlertController(title: NSLocalizedString("alertTitle", comment: ""),
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("alertButtonOK", comment: ""), style: .default))
        present(alert, animated: true)
    }
    
}
