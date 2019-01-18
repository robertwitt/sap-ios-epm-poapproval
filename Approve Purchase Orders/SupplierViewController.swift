//
//  SupplierViewController.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 12.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MessageUI
import SAPFiori
import SAPOData

class SupplierViewController: UITableViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    private enum TableViewRow: Int {
        case email = 0
        case phone = 1
        case fax = 2
        case address = 3
        case map = 4
        static let count = 5
    }
    
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
        tableView.register(FUIKeyValueFormCell.self, forCellReuseIdentifier: FUIKeyValueFormCell.reuseIdentifier)
        tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: MapCell.reuseIdentifier)
    }

    // MARK: Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewRow.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableViewRow(rawValue: indexPath.row)! {
        case .map:
            return mapCellForRowAtIndexPath(indexPath)
        default:
            return keyValueCellForRowAtIndexPath(indexPath)
        }
    }
    
    private func keyValueCellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIKeyValueFormCell.reuseIdentifier, for: indexPath) as! FUIKeyValueFormCell
        cell.isEditable = false
        cell.isAutoFitting = true
        switch TableViewRow(rawValue: indexPath.row)! {
        case .email:
            cell.keyName = NSLocalizedString("poSupplierEmail", comment: "")
            cell.value = supplier?.contactEmail ?? ""
            break
        case .phone:
            cell.keyName = NSLocalizedString("poSupplierPhone", comment: "")
            cell.value = supplier?.contactPhone ?? ""
            break
        case .fax:
            cell.keyName = NSLocalizedString("poSupplierFax", comment: "")
            cell.value = supplier?.contactFax ?? ""
            break
        case .address:
            cell.keyName = NSLocalizedString("poSupplierAddress", comment: "")
            cell.value = supplier?.formattedAddress ?? ""
            break
        default:
            break
        }
        return cell
    }
    
    private func mapCellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.reuseIdentifier, for: indexPath) as! MapCell
        cell.address = supplier?.formattedAddress
        print(cell.mapView)
        return cell
    }
    
    // MARK: Actions
    
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func emailTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            showAlert(withMessage: NSLocalizedString("mailServicesUnavailable", comment: ""))
            return
        }
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([supplier!.contactEmail!])
    }
    
    @objc func messageTapped(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else {
            showAlert(withMessage: NSLocalizedString("messageServicesUnavailable", comment: ""))
            return
        }
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        messageComposer.recipients = [supplier!.contactPhone!]
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
            activityControl.activityItems[.message]?.addTarget(self, action: #selector(messageTapped(_:)), for: .touchUpInside)
        }
        if supplier?.contactEmail != nil {
            activityControl.addActivity(.email)
            activityControl.activityItems[.email]?.setTintColor(color, for: .normal)
            activityControl.activityItems[.email]?.addTarget(self, action: #selector(emailTapped(_:)), for: .touchUpInside)
        }
        profileHeader.detailContentView = activityControl
    }
    
}

// MARK: - Mail Compose View Controller Delegate

extension SupplierViewController {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            showAlert(withError: error)
        }
        if result == .sent {
            FUIToastMessage.show(message: NSLocalizedString("mailSent", comment: ""))
        }
    }
    
}

// MARK: - Message Compose View Controller Delegate

extension SupplierViewController {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        if result == .sent {
            FUIToastMessage.show(message: NSLocalizedString("messageSent", comment: ""))
        }
    }
    
}
