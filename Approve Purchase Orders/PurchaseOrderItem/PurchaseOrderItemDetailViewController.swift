//
// PurchaseOrderItemDetailViewController.swift
// Approve Purchase Orders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/01/19
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class PurchaseOrderItemDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var epmrefappspoapvsrvEntities: EPMREFAPPSPOAPVSRVEntities<OnlineODataProvider> {
        return self.appDelegate.epmrefappspoapvsrvEntities
    }

    private var validity = [String: Bool]()
    private var _entity: PurchaseOrderItem?
    var allowsEditableCells = false
    var entity: PurchaseOrderItem {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "PurchaseOrderItemMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: EntityUpdaterDelegate?
    var tableUpdater: EntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            self.logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! PurchaseOrderItemDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.entity = self.entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForPoid(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.poid)
        case 1:
            return self.cellForPoItemPos(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.poItemPos)
        case 2:
            return self.cellForProduct(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.product)
        case 3:
            return self.cellForPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.price)
        case 4:
            return self.cellForPriceCurrency(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.priceCurrency)
        case 5:
            return self.cellForGrossAmount(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.grossAmount)
        case 6:
            return self.cellForGrossAmountCurrency(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.grossAmountCurrency)
        case 7:
            return self.cellForQuantity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.quantity)
        case 8:
            return self.cellForQuantityUnit(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.quantityUnit)
        case 9:
            return self.cellForDeliveryDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: PurchaseOrderItem.deliveryDate)
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    override func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row < 10 {
            return true
        }
        return false
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.preventNavigationLoop {
            return
        }
        switch indexPath.row {
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForPoid(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.poid {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.poid = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.poid.isOptional || newValue != "" {
                    currentEntity.poid = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPoItemPos(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.poItemPos {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.poItemPos = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.poItemPos.isOptional || newValue != "" {
                    currentEntity.poItemPos = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProduct(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.product {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.product = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.product.isOptional || newValue != "" {
                    currentEntity.product = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.price {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.price = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.price = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPriceCurrency(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.priceCurrency {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.priceCurrency = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.priceCurrency.isOptional || newValue != "" {
                    currentEntity.priceCurrency = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGrossAmount(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.grossAmount {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.grossAmount = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.grossAmount = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGrossAmountCurrency(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.grossAmountCurrency {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.grossAmountCurrency = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.grossAmountCurrency.isOptional || newValue != "" {
                    currentEntity.grossAmountCurrency = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantity(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantity {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantity = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.quantity = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantityUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantityUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantityUnit = nil
                isNewValueValid = true
            } else {
                if PurchaseOrderItem.quantityUnit.isOptional || newValue != "" {
                    currentEntity.quantityUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDeliveryDate(tableView: UITableView, indexPath: IndexPath, currentEntity: PurchaseOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.deliveryDate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.deliveryDate = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.deliveryDate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.epmrefappspoapvsrvEntities.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> PurchaseOrderItem {
        let newEntity = PurchaseOrderItem()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.poid == nil || newEntity.poid!.isEmpty {
            self.validity["POId"] = false
        }
        if newEntity.poItemPos == nil || newEntity.poItemPos!.isEmpty {
            self.validity["POItemPos"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.epmrefappspoapvsrvEntities.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            })
        }
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension PurchaseOrderItemDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! PurchaseOrderItem
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
