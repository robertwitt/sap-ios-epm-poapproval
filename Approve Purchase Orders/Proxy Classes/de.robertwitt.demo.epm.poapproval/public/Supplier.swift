// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

open class Supplier: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Id")

    private static var name_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Name")

    private static var phone_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Phone")

    private static var email_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Email")

    private static var web_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "Web")

    private static var formattedAddress_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "FormattedAddress")

    private static var formattedContactName_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "FormattedContactName")

    private static var contactPhone_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactPhone")

    private static var contactFax_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactFax")

    private static var contactEmail_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactEmail")

    private static var changedAt_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier.property(withName: "ChangedAt")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: EPMREFAPPSPOAPVSRVEntitiesMetadata.EntityTypes.supplier)
    }

    open class func array(from: EntityValueList) -> Array<Supplier> {
        return ArrayConverter.convert(from.toArray(), Array<Supplier>())
    }

    open class var changedAt: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.changedAt_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.changedAt_ = value
            }
        }
    }

    open var changedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Supplier.changedAt))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.changedAt, to: value)
        }
    }

    open class var contactEmail: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.contactEmail_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.contactEmail_ = value
            }
        }
    }

    open var contactEmail: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.contactEmail))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.contactEmail, to: StringValue.of(optional: value))
        }
    }

    open class var contactFax: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.contactFax_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.contactFax_ = value
            }
        }
    }

    open var contactFax: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.contactFax))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.contactFax, to: StringValue.of(optional: value))
        }
    }

    open class var contactPhone: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.contactPhone_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.contactPhone_ = value
            }
        }
    }

    open var contactPhone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.contactPhone))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.contactPhone, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Supplier {
        return CastRequired<Supplier>.from(self.copyEntity())
    }

    open class var email: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.email_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.email_ = value
            }
        }
    }

    open var email: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.email))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.email, to: StringValue.of(optional: value))
        }
    }

    open class var formattedAddress: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.formattedAddress_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.formattedAddress_ = value
            }
        }
    }

    open var formattedAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.formattedAddress))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.formattedAddress, to: StringValue.of(optional: value))
        }
    }

    open class var formattedContactName: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.formattedContactName_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.formattedContactName_ = value
            }
        }
    }

    open var formattedContactName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.formattedContactName))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.formattedContactName, to: StringValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.id_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.id))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(optional: id))
    }

    open class var name: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.name_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.name))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.name, to: StringValue.of(optional: value))
        }
    }

    open var old: Supplier {
        return CastRequired<Supplier>.from(self.oldEntity)
    }

    open class var phone: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.phone_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.phone_ = value
            }
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.phone))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.phone, to: StringValue.of(optional: value))
        }
    }

    open class var web: Property {
        get {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                return Supplier.web_
            }
        }
        set(value) {
            objc_sync_enter(Supplier.self)
            defer { objc_sync_exit(Supplier.self) }
            do {
                Supplier.web_ = value
            }
        }
    }

    open var web: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.web))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.web, to: StringValue.of(optional: value))
        }
    }
}
