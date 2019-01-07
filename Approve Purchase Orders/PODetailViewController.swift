//
//  PODetailViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPOData

class PODetailViewController: UITableViewController {
    
    // MARK: Properties
    
    var delegate: PODetailViewControllerDelegate?
    var purchaseOrderID: String?
    private var purchaseOrder: PurchaseOrder?

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshDetail()
    }

    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    
    // MARK: IB Actions
    
    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: NSLocalizedString("poActionSheetTitle", comment: ""), message: nil, preferredStyle: .actionSheet)
        actionSheet.popoverPresentationController?.barButtonItem = sender
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("poActionApprove", comment: ""), style: .default, handler: { (action) in
            let actionController = POActionController(viewController: self)
            actionController.approvePurchaseOrder(self.purchaseOrder!, completion: { (success, error) in
                self.delegate?.poDetailController(self, didFinishWithAction: .approved)
            })
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("poActionReject", comment: ""), style: .destructive, handler: { (action) in
            let actionController = POActionController(viewController: self)
            actionController.rejectPurchaseOrder(self.purchaseOrder!, completion: { (success, error) in
                self.delegate?.poDetailController(self, didFinishWithAction: .rejected)
            })
        }))
        if !presentedInSplitView {
            actionSheet.addAction(UIAlertAction(title: NSLocalizedString("poActionCancel", comment: ""), style: .cancel))
        }
        self.present(actionSheet, animated: true)
    }
    
    // MARK: Data Access
    
    private func refreshDetail() {
        guard let purchaseOrderID = purchaseOrderID else {
            return
        }
        
        let loadingIndicator = FUIModalLoadingIndicatorView()
        loadingIndicator.show(inView: view, animated: true)
        
        let query = DataQuery().withKey(PurchaseOrder.key(poid: purchaseOrderID)).expand(PurchaseOrder.purchaseOrderItems)
        self.dataService.fetchPurchaseOrder(matching: query) { (purchaseOrder, error) in
            if let error = error {
                self.showAlert(withError: error)
            }
            self.purchaseOrder = purchaseOrder
            self.refreshHeader()
            self.tableView.reloadData()
            loadingIndicator.dismiss()
        }
    }
    
    private func refreshHeader() {
        let header = FUIObjectHeader()
        header.headlineText = purchaseOrder?.supplierName
        if let orderedByName = purchaseOrder?.orderedByName {
            header.subheadlineText = String(format: NSLocalizedString("poOrderedByWithName", comment: ""), orderedByName)
        }
        header.footnoteText = purchaseOrder?.formattedChangedAt
        header.statusText = purchaseOrder?.formattedGrossAmount
        tableView.tableHeaderView = header
    }

}

// MARK: - Purchase Order Detail View Controller Delegate

protocol PODetailViewControllerDelegate {
    
    func poDetailController(_ poDetailController: PODetailViewController, didFinishWithAction action: PurchaseOrderAction)
    
}
