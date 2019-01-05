// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

open class EPMREFAPPSPOAPVSRVEntities<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = EPMREFAPPSPOAPVSRVEntitiesMetadata.document
    }

    open func approvePurchaseOrder(poid: String?, note: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> FunctionImportResult {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<FunctionImportResult>.from(self.executeQuery(var_query.invoke(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.approvePurchaseOrder, ParameterList(capacity: (2 as Int)).with(name: "POId", value: StringValue.of(optional: poid)).with(name: "Note", value: StringValue.of(optional: note))), headers: var_headers, options: var_options).result)
    }

    open func approvePurchaseOrder(poid: String?, note: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (FunctionImportResult?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: FunctionImportResult = try self.approvePurchaseOrder(poid: poid, note: note, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrder(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrder {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrder>.from(self.executeQuery(query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrder(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrder?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: PurchaseOrder = try self.fetchPurchaseOrder(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrderItem>.from(self.executeQuery(query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderItem?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: PurchaseOrderItem = try self.fetchPurchaseOrderItem(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<PurchaseOrderItem> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try PurchaseOrderItem.array(from: self.executeQuery(var_query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<PurchaseOrderItem>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<PurchaseOrderItem> = try self.fetchPurchaseOrderItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<PurchaseOrder> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try PurchaseOrder.array(from: self.executeQuery(var_query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrders(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<PurchaseOrder>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<PurchaseOrder> = try self.fetchPurchaseOrders(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Supplier>.from(self.executeQuery(query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Supplier?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Supplier = try self.fetchSupplier(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSuppliers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Supplier> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Supplier.array(from: self.executeQuery(var_query.fromDefault(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Supplier> = try self.fetchSuppliers(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery()) throws -> Array<PurchaseOrderItem> {
        return try self.fetchPurchaseOrderItems(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<PurchaseOrderItem>?, Error?) -> Void) {
        self.fetchPurchaseOrderItems(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrders")
    open func purchaseOrders(query: DataQuery = DataQuery()) throws -> Array<PurchaseOrder> {
        return try self.fetchPurchaseOrders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrders")
    open func purchaseOrders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<PurchaseOrder>?, Error?) -> Void) {
        self.fetchPurchaseOrders(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: EPMREFAPPSPOAPVSRVEntitiesMetadataParser.options)
            EPMREFAPPSPOAPVSRVEntitiesMetadataChanges.merge(metadata: self.metadata)
        }
    }

    open func rejectPurchaseOrder(poid: String?, note: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> FunctionImportResult {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<FunctionImportResult>.from(self.executeQuery(var_query.invoke(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.rejectPurchaseOrder, ParameterList(capacity: (2 as Int)).with(name: "POId", value: StringValue.of(optional: poid)).with(name: "Note", value: StringValue.of(optional: note))), headers: var_headers, options: var_options).result)
    }

    open func rejectPurchaseOrder(poid: String?, note: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (FunctionImportResult?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: FunctionImportResult = try self.rejectPurchaseOrder(poid: poid, note: note, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try self.fetchSuppliers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.fetchSuppliers(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }
}
