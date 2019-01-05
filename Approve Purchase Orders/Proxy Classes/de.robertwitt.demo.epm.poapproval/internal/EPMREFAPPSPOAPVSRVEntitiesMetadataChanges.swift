// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

internal class EPMREFAPPSPOAPVSRVEntitiesMetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        EPMREFAPPSPOAPVSRVEntitiesMetadata.document = metadata
        EPMREFAPPSPOAPVSRVEntitiesMetadataChanges.merge1(metadata: metadata)
        try! EPMREFAPPSPOAPVSRVEntitiesFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult = metadata.complexType(withName: "EPM_REF_APPS_PO_APV_SRV.FunctionImportResult")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder = metadata.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.PurchaseOrder")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem = metadata.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.PurchaseOrderItem")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier = metadata.entityType(withName: "EPM_REF_APPS_PO_APV_SRV.Supplier")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrderItems = metadata.entitySet(withName: "PurchaseOrderItems")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.purchaseOrders = metadata.entitySet(withName: "PurchaseOrders")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.EntitySets.suppliers = metadata.entitySet(withName: "Suppliers")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.approvePurchaseOrder.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.approvePurchaseOrder = metadata.dataMethod(withName: "ApprovePurchaseOrder")
        }
        if !EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.rejectPurchaseOrder.isRemoved {
            EPMREFAPPSPOAPVSRVEntitiesMetadata.ActionImports.rejectPurchaseOrder = metadata.dataMethod(withName: "RejectPurchaseOrder")
        }
        if !FunctionImportResult.success.isRemoved {
            FunctionImportResult.success = EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult.property(withName: "Success")
        }
        if !PurchaseOrder.poid.isRemoved {
            PurchaseOrder.poid = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "POId")
        }
        if !PurchaseOrder.orderedByID.isRemoved {
            PurchaseOrder.orderedByID = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "OrderedById")
        }
        if !PurchaseOrder.orderedByName.isRemoved {
            PurchaseOrder.orderedByName = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "OrderedByName")
        }
        if !PurchaseOrder.changedAt.isRemoved {
            PurchaseOrder.changedAt = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "ChangedAt")
        }
        if !PurchaseOrder.supplierID.isRemoved {
            PurchaseOrder.supplierID = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "SupplierId")
        }
        if !PurchaseOrder.supplierName.isRemoved {
            PurchaseOrder.supplierName = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "SupplierName")
        }
        if !PurchaseOrder.deliveryAddress.isRemoved {
            PurchaseOrder.deliveryAddress = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "DeliveryAddress")
        }
        if !PurchaseOrder.deliveryDateEarliest.isRemoved {
            PurchaseOrder.deliveryDateEarliest = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "DeliveryDateEarliest")
        }
        if !PurchaseOrder.laterDelivDateExist.isRemoved {
            PurchaseOrder.laterDelivDateExist = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "LaterDelivDateExist")
        }
        if !PurchaseOrder.grossAmount.isRemoved {
            PurchaseOrder.grossAmount = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "GrossAmount")
        }
        if !PurchaseOrder.currencyCode.isRemoved {
            PurchaseOrder.currencyCode = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "CurrencyCode")
        }
        if !PurchaseOrder.itemCount.isRemoved {
            PurchaseOrder.itemCount = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "ItemCount")
        }
        if !PurchaseOrder.supplier.isRemoved {
            PurchaseOrder.supplier = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "Supplier")
        }
        if !PurchaseOrder.purchaseOrderItems.isRemoved {
            PurchaseOrder.purchaseOrderItems = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "PurchaseOrderItems")
        }
        if !PurchaseOrderItem.poid.isRemoved {
            PurchaseOrderItem.poid = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "POId")
        }
        if !PurchaseOrderItem.poItemPos.isRemoved {
            PurchaseOrderItem.poItemPos = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "POItemPos")
        }
        if !PurchaseOrderItem.product.isRemoved {
            PurchaseOrderItem.product = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Product")
        }
        if !PurchaseOrderItem.price.isRemoved {
            PurchaseOrderItem.price = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Price")
        }
        if !PurchaseOrderItem.priceCurrency.isRemoved {
            PurchaseOrderItem.priceCurrency = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "PriceCurrency")
        }
        if !PurchaseOrderItem.grossAmount.isRemoved {
            PurchaseOrderItem.grossAmount = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")
        }
        if !PurchaseOrderItem.grossAmountCurrency.isRemoved {
            PurchaseOrderItem.grossAmountCurrency = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmountCurrency")
        }
        if !PurchaseOrderItem.quantity.isRemoved {
            PurchaseOrderItem.quantity = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")
        }
        if !PurchaseOrderItem.quantityUnit.isRemoved {
            PurchaseOrderItem.quantityUnit = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")
        }
        if !PurchaseOrderItem.deliveryDate.isRemoved {
            PurchaseOrderItem.deliveryDate = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "DeliveryDate")
        }
        if !Supplier.id.isRemoved {
            Supplier.id = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Id")
        }
        if !Supplier.name.isRemoved {
            Supplier.name = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Name")
        }
        if !Supplier.phone.isRemoved {
            Supplier.phone = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Phone")
        }
        if !Supplier.email.isRemoved {
            Supplier.email = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Email")
        }
        if !Supplier.web.isRemoved {
            Supplier.web = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Web")
        }
        if !Supplier.formattedAddress.isRemoved {
            Supplier.formattedAddress = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "FormattedAddress")
        }
        if !Supplier.formattedContactName.isRemoved {
            Supplier.formattedContactName = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "FormattedContactName")
        }
        if !Supplier.contactPhone.isRemoved {
            Supplier.contactPhone = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactPhone")
        }
        if !Supplier.contactFax.isRemoved {
            Supplier.contactFax = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactFax")
        }
        if !Supplier.contactEmail.isRemoved {
            Supplier.contactEmail = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactEmail")
        }
        if !Supplier.changedAt.isRemoved {
            Supplier.changedAt = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ChangedAt")
        }
    }
}
