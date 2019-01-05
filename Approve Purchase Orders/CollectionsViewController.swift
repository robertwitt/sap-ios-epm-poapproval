//
// CollectionsViewController.swift
// Approve Purchase Orders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/01/19
//

import Foundation
import SAPFiori
import SAPOData

protocol EntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol EntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class CollectionsViewController: FUIFormTableViewController {
    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .suppliers:
            let supplierStoryBoard = UIStoryboard(name: "Supplier", bundle: nil)
            masterViewController = supplierStoryBoard.instantiateViewController(withIdentifier: "SupplierMaster")
            (masterViewController as! SupplierMasterViewController).entitySetName = "Suppliers"
            func fetchSuppliers(_ completionHandler: @escaping ([Supplier]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.epmrefappspoapvsrvEntities!.fetchSuppliers(matching: query) { suppliers, error in
                        if error == nil {
                            completionHandler(suppliers, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! SupplierMasterViewController).loadEntitiesBlock = fetchSuppliers
            masterViewController.navigationItem.title = "Supplier"
        case .purchaseOrderItems:
            let purchaseOrderItemStoryBoard = UIStoryboard(name: "PurchaseOrderItem", bundle: nil)
            masterViewController = purchaseOrderItemStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderItemMaster")
            (masterViewController as! PurchaseOrderItemMasterViewController).entitySetName = "PurchaseOrderItems"
            func fetchPurchaseOrderItems(_ completionHandler: @escaping ([PurchaseOrderItem]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.epmrefappspoapvsrvEntities!.fetchPurchaseOrderItems(matching: query) { purchaseOrderItems, error in
                        if error == nil {
                            completionHandler(purchaseOrderItems, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! PurchaseOrderItemMasterViewController).loadEntitiesBlock = fetchPurchaseOrderItems
            masterViewController.navigationItem.title = "PurchaseOrderItem"
        case .purchaseOrders:
            let purchaseOrderStoryBoard = UIStoryboard(name: "PurchaseOrder", bundle: nil)
            masterViewController = purchaseOrderStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderMaster")
            (masterViewController as! PurchaseOrderMasterViewController).entitySetName = "PurchaseOrders"
            func fetchPurchaseOrders(_ completionHandler: @escaping ([PurchaseOrder]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.epmrefappspoapvsrvEntities!.fetchPurchaseOrders(matching: query) { purchaseOrders, error in
                        if error == nil {
                            completionHandler(purchaseOrders, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! PurchaseOrderMasterViewController).loadEntitiesBlock = fetchPurchaseOrders
            masterViewController.navigationItem.title = "PurchaseOrder"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.epmrefappspoapvsrvEntities == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
