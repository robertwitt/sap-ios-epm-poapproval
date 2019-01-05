// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

public class EPMREFAPPSPOAPVSRVEntitiesMetadata {
    private static var document_: CSDLDocument = EPMREFAPPSPOAPVSRVEntitiesMetadata.resolve()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.self)
            defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.self) }
            do {
                return EPMREFAPPSPOAPVSRVEntitiesMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.self)
            defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.self) }
            do {
                EPMREFAPPSPOAPVSRVEntitiesMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! EPMREFAPPSPOAPVSRVEntitiesFactory.registerAll()
        EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.hasGeneratedProxies = true
        return EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed
    }

    public class ComplexTypes {
        private static var functionImportResult_: ComplexType = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.complexType(withName: "EPM_REF_APPS_PO_APV_SRV.FunctionImportResult")

        public static var functionImportResult: ComplexType {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult_ = value
                }
            }
        }
    }

    public class EntityTypes {
        private static var purchaseOrder_: EntityType = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.PurchaseOrder")

        private static var purchaseOrderItem_: EntityType = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.PurchaseOrderItem")

        private static var supplier_: EntityType = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.Supplier")

        public static var purchaseOrder: EntityType {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder_ = value
                }
            }
        }

        public static var purchaseOrderItem: EntityType {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem_ = value
                }
            }
        }

        public static var supplier: EntityType {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var purchaseOrderItems_: EntitySet = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

        private static var purchaseOrders_: EntitySet = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entitySet(withName: "PurchaseOrders")

        private static var suppliers_: EntitySet = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.entitySet(withName: "Suppliers")

        public static var purchaseOrderItems: EntitySet {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems_ = value
                }
            }
        }

        public static var purchaseOrders: EntitySet {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders_ = value
                }
            }
        }

        public static var suppliers: EntitySet {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers_ = value
                }
            }
        }
    }

    public class ActionImports {
        private static var approvePurchaseOrder_: DataMethod = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.dataMethod(withName: "ApprovePurchaseOrder")

        private static var rejectPurchaseOrder_: DataMethod = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parsed.dataMethod(withName: "RejectPurchaseOrder")

        public static var approvePurchaseOrder: DataMethod {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.approvePurchaseOrder_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.approvePurchaseOrder_ = value
                }
            }
        }

        public static var rejectPurchaseOrder: DataMethod {
            get {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self) }
                do {
                    return EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.rejectPurchaseOrder_
                }
            }
            set(value) {
                objc_sync_enter(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self)
                defer { objc_sync_exit(EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.self) }
                do {
                    EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.rejectPurchaseOrder_ = value
                }
            }
        }
    }
}
