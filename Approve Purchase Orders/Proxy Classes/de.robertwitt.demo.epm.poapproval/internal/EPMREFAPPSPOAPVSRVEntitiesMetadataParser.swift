// # Proxy Compiler 18.9.4-973a4d-20181128

import Foundation
import SAPOData

internal class EPMREFAPPSPOAPVSRVEntitiesMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = EPMREFAPPSPOAPVSRVEntitiesMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(EPMREFAPPSPOAPVSRVEntitiesMetadataText.xml, url: "EPM_REF_APPS_PO_APV_SRV")
        metadata.proxyVersion = "18.9.4-973a4d-20181128"
        return metadata
    }
}
