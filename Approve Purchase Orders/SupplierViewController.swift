//
//  SupplierViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 12.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit

class SupplierViewController: UITableViewController {
    
    // MARK: Properties
    
    var supplierID: String?
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
    }
    
    private func configureHeader() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        self.navigationItem.leftBarButtonItem = doneButton
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
    
    // MARK: Actions
    
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
