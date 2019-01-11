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
    
    private enum TableViewSection: Int {
        case generalInformation = 0
        case items = 1
        static let count = 2
    }
    
    private enum TableViewInfoRow: Int {
        case id = 0
        case deliveryDate = 1
        case deliveryAddress = 2
        static let count = 3
    }
    
    // MARK: Properties
    
    var delegate: PODetailViewControllerDelegate?
    var purchaseOrderID: String?
    private var purchaseOrder: PurchaseOrder?

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        refreshDetail()
    }
    
    private func configureTableView() {
        tableView.register(FUIKeyValueFormCell.self, forCellReuseIdentifier: FUIKeyValueFormCell.reuseIdentifier)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        let header = FUIObjectHeader()
        header.headlineText = " "
        header.subheadlineText = " "
        header.footnoteText = " "
        header.statusText = " "
        tableView.tableHeaderView = header
    }

    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableViewSection(rawValue: section)! {
        case .generalInformation:
            return TableViewInfoRow.count
        case .items:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = FUITableViewHeaderFooterView(style: .title)
        switch TableViewSection(rawValue: section)! {
        case .generalInformation:
            header.titleLabel.text = NSLocalizedString("poDetailTitleInfo", comment: "")
            break
        case .items:
            header.titleLabel.text = NSLocalizedString("poDetailTitleItems", comment: "")
            break
        }
        return header
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableViewSection(rawValue: indexPath.section)! {
        case .generalInformation:
            return infoCellForAtIndexPath(indexPath)
        case .items:
            return UITableViewCell()
        }
    }
    
    private func infoCellForAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIKeyValueFormCell.reuseIdentifier, for: indexPath) as! FUIKeyValueFormCell
        guard let purchaseOrder = purchaseOrder else {
            return cell
        }
        
        switch TableViewInfoRow(rawValue: indexPath.row)! {
        case .id:
            cell.keyName = NSLocalizedString("poID", comment: "")
            cell.value = purchaseOrder.poid!
        case .deliveryDate:
            cell.keyName = NSLocalizedString("poDeliveryDate", comment: "")
            cell.value = String(format: NSLocalizedString("poDeliveryDateEarliest", comment: ""), purchaseOrder.formattedEarliestDeliveryDate ?? "")
        case .deliveryAddress:
            cell.keyName = NSLocalizedString("poDeliveryAddress", comment: "")
            cell.value = purchaseOrder.deliveryAddress ?? ""
        }
        return cell
    }
    
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
        guard let header = tableView.tableHeaderView as? FUIObjectHeader else {
            return
        }
        header.headlineText = purchaseOrder?.supplierName
        if let orderedByName = purchaseOrder?.orderedByName {
            header.subheadlineText = String(format: NSLocalizedString("poOrderedByWithName", comment: ""), orderedByName)
        }
        header.footnoteText = purchaseOrder?.formattedChangedAt
        header.statusText = purchaseOrder?.formattedGrossAmount
    }

}

// MARK: - Purchase Order Detail View Controller Delegate

protocol PODetailViewControllerDelegate {
    
    func poDetailController(_ poDetailController: PODetailViewController, didFinishWithAction action: PurchaseOrderAction)
    
}
