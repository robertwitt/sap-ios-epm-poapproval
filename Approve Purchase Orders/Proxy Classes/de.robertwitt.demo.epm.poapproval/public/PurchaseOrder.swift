// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

open class PurchaseOrder: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var poid_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "POId")

    private static var orderedByID_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "OrderedById")

    private static var orderedByName_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "OrderedByName")

    private static var changedAt_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "ChangedAt")

    private static var supplierID_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "SupplierId")

    private static var supplierName_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "SupplierName")

    private static var deliveryAddress_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "DeliveryAddress")

    private static var deliveryDateEarliest_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "DeliveryDateEarliest")

    private static var laterDelivDateExist_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "LaterDelivDateExist")

    private static var grossAmount_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "GrossAmount")

    private static var currencyCode_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "CurrencyCode")

    private static var itemCount_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "ItemCount")

    private static var supplier_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "Supplier")

    private static var purchaseOrderItems_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder.property(withName: "PurchaseOrderItems")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrder)
    }

    open class func array(from: EntityValueList) -> Array<PurchaseOrder> {
        return ArrayConverter.convert(from.toArray(), Array<PurchaseOrder>())
    }

    open class var changedAt: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.changedAt_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.changedAt_ = value
            }
        }
    }

    open var changedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: PurchaseOrder.changedAt))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.changedAt, to: value)
        }
    }

    open func copy() -> PurchaseOrder {
        return CastRequired<PurchaseOrder>.from(self.copyEntity())
    }

    open class var currencyCode: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open class var deliveryAddress: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.deliveryAddress_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.deliveryAddress_ = value
            }
        }
    }

    open var deliveryAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.deliveryAddress))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.deliveryAddress, to: StringValue.of(optional: value))
        }
    }

    open class var deliveryDateEarliest: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.deliveryDateEarliest_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.deliveryDateEarliest_ = value
            }
        }
    }

    open var deliveryDateEarliest: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: PurchaseOrder.deliveryDateEarliest))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.deliveryDateEarliest, to: value)
        }
    }

    open class var grossAmount: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrder.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class var itemCount: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.itemCount_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.itemCount_ = value
            }
        }
    }

    open var itemCount: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: PurchaseOrder.itemCount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.itemCount, to: IntValue.of(optional: value))
        }
    }

    open class func key(poid: String?) -> EntityKey {
        return EntityKey().with(name: "POId", value: StringValue.of(optional: poid))
    }

    open class var laterDelivDateExist: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.laterDelivDateExist_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.laterDelivDateExist_ = value
            }
        }
    }

    open var laterDelivDateExist: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.laterDelivDateExist))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.laterDelivDateExist, to: StringValue.of(optional: value))
        }
    }

    open var old: PurchaseOrder {
        return CastRequired<PurchaseOrder>.from(self.oldEntity)
    }

    open class var orderedByID: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.orderedByID_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.orderedByID_ = value
            }
        }
    }

    open var orderedByID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.orderedByID))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.orderedByID, to: StringValue.of(optional: value))
        }
    }

    open class var orderedByName: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.orderedByName_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.orderedByName_ = value
            }
        }
    }

    open var orderedByName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.orderedByName))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.orderedByName, to: StringValue.of(optional: value))
        }
    }

    open class var poid: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.poid_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.poid_ = value
            }
        }
    }

    open var poid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.poid))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.poid, to: StringValue.of(optional: value))
        }
    }

    open class var purchaseOrderItems: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.purchaseOrderItems_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.purchaseOrderItems_ = value
            }
        }
    }

    open var purchaseOrderItems: Array<PurchaseOrderItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: PurchaseOrder.purchaseOrderItems)).toArray(), Array<PurchaseOrderItem>())
        }
        set(value) {
            PurchaseOrder.purchaseOrderItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class var supplier: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.supplier_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.supplier_ = value
            }
        }
    }

    open var supplier: Supplier? {
        get {
            return CastOptional<Supplier>.from(self.optionalValue(for: PurchaseOrder.supplier))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.supplier, to: value)
        }
    }

    open class var supplierID: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.supplierID_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.supplierID_ = value
            }
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.supplierID, to: StringValue.of(optional: value))
        }
    }

    open class var supplierName: Property {
        get {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                return PurchaseOrder.supplierName_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrder.self)
            defer { objc_sync_exit(PurchaseOrder.self) }
            do {
                PurchaseOrder.supplierName_ = value
            }
        }
    }

    open var supplierName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrder.supplierName))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrder.supplierName, to: StringValue.of(optional: value))
        }
    }
}
