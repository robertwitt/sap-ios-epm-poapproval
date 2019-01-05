//
//  PODetailViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 05.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class PODetailViewController: UITableViewController {
    
    // MARK: Properties
    var purchaseOrderID: String?

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
    
    // MARK: Data Access
    
    private func refreshDetail() {
        refreshHeader()
        tableView.reloadData()
    }
    
    private func refreshHeader() {
        let header = FUIObjectHeader()
        header.headlineText = "Panorama Studios"
        header.subheadlineText = "Ordered by Peter Fuchs"
        header.footnoteText = "2 days ago"
        header.statusText = "$6,196.26"
        tableView.tableHeaderView = header
    }

}
