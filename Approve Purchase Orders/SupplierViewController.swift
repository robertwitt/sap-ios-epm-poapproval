//
//  SupplierViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 12.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPOData

class SupplierViewController: UITableViewController {
    
    // MARK: Properties
    
    var supplierID: String?
    private var supplier: Supplier?
    private let profileHeader = FUIProfileHeader()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureHeader()
        refreshSupplier()
    }
    
    private func configureHeader() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.leftBarButtonItem = doneButton
        profileHeader.headlineText = " "
        profileHeader.subheadlineText = " "
        profileHeader.detailContentView = FUIActivityControl()
        tableView.addSubview(profileHeader)
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 98
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }

    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
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
    
    // MARK: Actions
    
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: Data Access
    
    private func refreshSupplier() {
        guard let supplierID = supplierID else {
            return
        }
        
        let loadingIndicator = FUIModalLoadingIndicatorView()
        loadingIndicator.show(inView: view, animated: true)
        
        let query = DataQuery().withKey(Supplier.key(id: supplierID))
        dataService.fetchSupplier(matching: query) { (supplier, error) in
            if let error = error {
                self.showAlert(withError: error)
            }
            self.supplier = supplier
            self.refreshHeader()
            self.tableView.reloadData()
            loadingIndicator.dismiss()
        }
    }
    
    private func refreshHeader() {
        profileHeader.headlineText = supplier?.formattedContactName
        profileHeader.subheadlineText = supplier?.name
        
        let activityControl = FUIActivityControl()
        let color = UIColor.preferredFioriColor(forStyle: .primary6)
        if supplier?.contactPhone != nil {
            activityControl.addActivities([.phone, .message])
            activityControl.activityItems[.phone]?.setTintColor(color, for: .normal)
            activityControl.activityItems[.message]?.setTintColor(color, for: .normal)
        }
        if supplier?.contactEmail != nil {
            activityControl.addActivity(.email)
            activityControl.activityItems[.email]?.setTintColor(color, for: .normal)
        }
        profileHeader.detailContentView = activityControl
    }
    
}
