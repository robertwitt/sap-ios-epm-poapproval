//
//  SupplierAnnotationView.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 18.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation
import MapKit
import SAPFiori

class SupplierAnnotationView: FUIMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            markerTintColor = UIColor.preferredFioriColor(forStyle: .map1)
            glyphImage = FUIIconLibrary.map.marker.venue.withRenderingMode(.alwaysTemplate)
            displayPriority = .defaultHigh
        }
    }
    
}
