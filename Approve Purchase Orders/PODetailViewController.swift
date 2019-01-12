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
        case supplier = 3
        static let count = 4
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
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let _ = purchaseOrder else {
            return 0
        }
        return TableViewSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableViewSection(rawValue: section)! {
        case .generalInformation:
            return TableViewInfoRow.count
        case .items:
            return purchaseOrder?.purchaseOrderItems.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = FUITableViewHeaderFooterView(style: .title)
        header.setBackgroundColor(UIColor.preferredFioriColor(forStyle: FUIColorStyle.tintColor, background: .dark))
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
            return infoCellForRowAtIndexPath(indexPath)
        case .items:
            return itemCellForRowAtIndexPath(indexPath)
        }
    }
    
    private func infoCellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PODetailInfo", for: indexPath)
        guard let purchaseOrder = purchaseOrder else {
            return cell
        }
        
        cell.detailTextLabel?.textColor = UIColor.preferredFioriColor(forStyle: .primary3)
        switch TableViewInfoRow(rawValue: indexPath.row)! {
        case .id:
            cell.textLabel?.text = NSLocalizedString("poID", comment: "")
            cell.detailTextLabel?.text = purchaseOrder.poid!
            break
        case .deliveryDate:
            cell.textLabel?.text = NSLocalizedString("poDeliveryDate", comment: "")
            cell.detailTextLabel?.text = String(format: NSLocalizedString("poDeliveryDateEarliest", comment: ""), purchaseOrder.formattedEarliestDeliveryDate ?? "")
            break
        case .deliveryAddress:
            cell.textLabel?.text = NSLocalizedString("poDeliveryAddress", comment: "")
            cell.detailTextLabel?.text = purchaseOrder.deliveryAddress ?? ""
            break
        case .supplier:
            cell.textLabel?.text = NSLocalizedString("poSupplier", comment: "")
            cell.detailTextLabel?.text = purchaseOrder.supplierName ?? ""
            cell.accessoryType = .detailButton
            break
        }
        return cell
    }
    
    private func itemCellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        guard let item = purchaseOrder?.purchaseOrderItems[indexPath.row] else {
            return cell
        }
        
        cell.headlineText = item.product
        cell.subheadlineText = item.poItemPos
        if let formattedDeliveryDate = item.formattedDeliveryDate {
            cell.footnoteText = String(format: NSLocalizedString("poItemDeliveryDate", comment: ""), formattedDeliveryDate)
        }
        cell.statusText = item.formattedGrossAmount
        if let formattedPrice = item.formattedPrice, let formattedQuantity = item.formattedQuantity {
            cell.substatusText = String(format: NSLocalizedString("poItemPriceAndQuantity", comment: ""), formattedPrice, formattedQuantity)
        }
        cell.splitPercent = CGFloat(0.3)
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
        if tableView.tableHeaderView == nil {
            tableView.tableHeaderView = FUIObjectHeader()
        }
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
