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

class POInboxViewController: UITableViewController, PODetailViewControllerDelegate {
    
    // MARK: Properties
    
    private var purchaseOrders = [PurchaseOrder]()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        refreshInbox()
    }
    
    private func configureTableView() {
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: Table View Data Source

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
        cell.footnoteText = purchaseOrder.formattedChangedAt
        cell.statusText = purchaseOrder.formattedGrossAmount
        if let itemCount = purchaseOrder.itemCount {
            cell.substatusText = String(format: NSLocalizedString("poItemCount", comment: ""), itemCount)
        }
        cell.accessoryType = presentedInSplitView ? .none : .disclosureIndicator
        cell.isMomentarySelection = !presentedInSplitView

        return cell
    }
    
    // MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard !presentedInSplitView else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        var actions = [UIContextualAction]()
        actions.append(UIContextualAction(style: .destructive, title: NSLocalizedString("poActionReject", comment: ""), handler: { (action, view, completion) in
            let purchaseOrder = self.purchaseOrders[indexPath.row]
            let actionController = POActionController(viewController: self)
            actionController.rejectPurchaseOrder(purchaseOrder, completion: { (success, error) in
                self.handlePOAction(at: indexPath, success: success, error: error, completion: completion)
            })
        }))
        let approveAction = UIContextualAction(style: .destructive, title: NSLocalizedString("poActionApprove", comment: ""), handler: { (action, view, completion) in
            let purchaseOrder = self.purchaseOrders[indexPath.row]
            let actionController = POActionController(viewController: self)
            actionController.approvePurchaseOrder(purchaseOrder, completion: { (success, error) in
                self.handlePOAction(at: indexPath, success: success, error: error, completion: completion)
            })
        })
        approveAction.backgroundColor = UIColor.preferredFioriColor(forStyle: FUIColorStyle.positive)
        actions.append(approveAction)
        
        return UISwipeActionsConfiguration(actions: actions)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseOrder = purchaseOrders[indexPath.row]
        let poDetailStoryboard = UIStoryboard(name: "PODetail", bundle: nil)
        let poDetailViewController = poDetailStoryboard.instantiateViewController(withIdentifier: "PODetail") as! PODetailViewController
        poDetailViewController.delegate = self
        poDetailViewController.purchaseOrderID = purchaseOrder.poid
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [poDetailViewController]
        splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }
    
    // MARK: IB Actions
    
    @IBAction func pullToRefresh(_ sender: UIRefreshControl) {
        refreshInbox(showLoadingIndicator: false)
    }
    
    // MARK: Data Access
    
    private func refreshInbox(showLoadingIndicator: Bool = true) {
        let loadingIndicator = FUIModalLoadingIndicatorView()
        if showLoadingIndicator {
            loadingIndicator.show(inView: view, animated: true)
        }
        
        self.dataService.fetchPurchaseOrders { (purchaseOrders, error) in
            if let error = error {
                self.showAlert(withError: error)
            }
            self.purchaseOrders = purchaseOrders ?? [PurchaseOrder]()
            self.refreshTitle()
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            loadingIndicator.dismiss()
        }
    }
    
    private func refreshTitle() {
        title = String(format: NSLocalizedString("poInboxTitleWithCount", comment: ""), purchaseOrders.count)
        UIApplication.shared.applicationIconBadgeNumber = self.purchaseOrders.count
    }
    
    private func handlePOAction(at indexPath: IndexPath, success: Bool, error: Error?, completion: (Bool) -> Void) {
        if let error = error {
            self.showAlert(withError: error)
        }
        if (success) {
            self.purchaseOrders.remove(at: indexPath.row)
            self.refreshTitle()
        }
        completion(success)
    }
    
}

// MARK: - Purchase Order Detail View Controller Delegate

extension POInboxViewController {
    
    func poDetailController(_ poDetailController: PODetailViewController, didFinishWithAction action: PurchaseOrderAction) {
        // Remove the details view controller
        if presentedInSplitView {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let rightNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
            rightNavigationController.viewControllers = []
            splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
        
        // Remove the selected row
        let indexPath = tableView.indexPathForSelectedRow!
        print(indexPath)
        purchaseOrders.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        refreshTitle()
    }
    
}
