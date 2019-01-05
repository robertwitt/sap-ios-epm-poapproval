//
//  POInboxViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPOData

class POInboxViewController: UITableViewController {
    
    // MARK: Properties
    
    private var purchaseOrders = [PurchaseOrder]()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        refreshInbox()
    }

    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.purchaseOrders.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let purchaseOrder = purchaseOrders[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineText = purchaseOrder.supplierName
        if let orderedByName = purchaseOrder.orderedByName {
            cell.subheadlineText = String(format: NSLocalizedString("poOrderedByWithName", comment: ""), orderedByName)
        }
        cell.footnoteText = purchaseOrder.changedAt?.toString()
        cell.statusText = purchaseOrder.grossAmount?.toString()
        cell.substatusText = purchaseOrder.currencyCode
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    /*
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Data Access
    
    private func refreshInbox() {
        let loadingIndicator = FUIModalLoadingIndicatorView()
        loadingIndicator.show(inView: view, animated: true)
        
        self.dataService.fetchPurchaseOrders { (purchaseOrders, error) in
            if let error = error {
                self.showAlert(withError: error)
            }
            self.purchaseOrders = purchaseOrders ?? [PurchaseOrder]()
            self.refreshTitle()
            self.tableView.reloadData()
            loadingIndicator.dismiss()
        }
    }
    
    private func refreshTitle() {
        title = String(format: NSLocalizedString("poInboxTitleWithCount", comment: ""), purchaseOrders.count)
    }
    
}
