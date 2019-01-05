// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

open class PurchaseOrderItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var poid_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "POId")

    private static var poItemPos_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "POItemPos")

    private static var product_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Product")

    private static var price_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Price")

    private static var priceCurrency_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "PriceCurrency")

    private static var grossAmount_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")

    private static var grossAmountCurrency_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmountCurrency")

    private static var quantity_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")

    private static var quantityUnit_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")

    private static var deliveryDate_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem.property(withName: "DeliveryDate")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.purchaseOrderItem)
    }

    open class func array(from: EntityValueList) -> Array<PurchaseOrderItem> {
        return ArrayConverter.convert(from.toArray(), Array<PurchaseOrderItem>())
    }

    open func copy() -> PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(self.copyEntity())
    }

    open class var deliveryDate: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.deliveryDate_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.deliveryDate_ = value
            }
        }
    }

    open var deliveryDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: PurchaseOrderItem.deliveryDate))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.deliveryDate, to: value)
        }
    }

    open class var grossAmount: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open class var grossAmountCurrency: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.grossAmountCurrency_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.grossAmountCurrency_ = value
            }
        }
    }

    open var grossAmountCurrency: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.grossAmountCurrency))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.grossAmountCurrency, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(poid: String?, poItemPos: String?) -> EntityKey {
        return EntityKey().with(name: "POId", value: StringValue.of(optional: poid)).with(name: "POItemPos", value: StringValue.of(optional: poItemPos))
    }

    open var old: PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(self.oldEntity)
    }

    open class var poItemPos: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.poItemPos_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.poItemPos_ = value
            }
        }
    }

    open var poItemPos: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.poItemPos))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.poItemPos, to: StringValue.of(optional: value))
        }
    }

    open class var poid: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.poid_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.poid_ = value
            }
        }
    }

    open var poid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.poid))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.poid, to: StringValue.of(optional: value))
        }
    }

    open class var price: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.price_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.price_ = value
            }
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.price))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.price, to: DecimalValue.of(optional: value))
        }
    }

    open class var priceCurrency: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.priceCurrency_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.priceCurrency_ = value
            }
        }
    }

    open var priceCurrency: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.priceCurrency))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.priceCurrency, to: StringValue.of(optional: value))
        }
    }

    open class var product: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.product_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.product_ = value
            }
        }
    }

    open var product: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.product))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.product, to: StringValue.of(optional: value))
        }
    }

    open class var quantity: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.quantity_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.quantity_ = value
            }
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open class var quantityUnit: Property {
        get {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                return PurchaseOrderItem.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(PurchaseOrderItem.self)
            defer { objc_sync_exit(PurchaseOrderItem.self) }
            do {
                PurchaseOrderItem.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }
}
