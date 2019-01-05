// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

internal class EPMREFAPPSPOAPVSRVEntitiesFactory {
    static func registerAll() throws {
        EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult.registerFactory(ObjectFactory.with(create: { FunctionImportResult(withDefaults: false) }, createWithDecoder: { d in try FunctionImportResult(from: d) }))
        EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.registerFactory(ObjectFactory.with(create: { PurchaseOrder(withDefaults: false) }, createWithDecoder: { d in try PurchaseOrder(from: d) }))
        EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.registerFactory(ObjectFactory.with(create: { PurchaseOrderItem(withDefaults: false) }, createWithDecoder: { d in try PurchaseOrderItem(from: d) }))
        EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { Supplier(withDefaults: false) }, createWithDecoder: { d in try Supplier(from: d) }))
        EPMREFAPPSPOAPVSRVEntitiesStaticResolver.resolve()
    }
}
