// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

open class FunctionImportResult: ComplexValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var success_: Property = EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult.property(withName: "Success")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: EPMREFAPPSPOAPVSRVEntitiesMetadata.ComplexTypes.functionImportResult)
    }

    open func copy() -> FunctionImportResult {
        return CastRequired<FunctionImportResult>.from(self.copyComplex())
    }

    open override var isProxy: Bool {
        return true
    }

    open var old: FunctionImportResult {
        return CastRequired<FunctionImportResult>.from(self.oldComplex)
    }

    open class var success: Property {
        get {
            objc_sync_enter(FunctionImportResult.self)
            defer { objc_sync_exit(FunctionImportResult.self) }
            do {
                return FunctionImportResult.success_
            }
        }
        set(value) {
            objc_sync_enter(FunctionImportResult.self)
            defer { objc_sync_exit(FunctionImportResult.self) }
            do {
                FunctionImportResult.success_ = value
            }
        }
    }

    open var success: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: FunctionImportResult.success))
        }
        set(value) {
            self.setOptionalValue(for: FunctionImportResult.success, to: BooleanValue.of(optional: value))
        }
    }
}
