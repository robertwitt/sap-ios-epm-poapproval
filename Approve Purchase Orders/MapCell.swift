//
//  MapCell.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 18.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {
    
    var address: String? {
        didSet {
            refreshMapView()
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    static let reuseIdentifier = "MapCell"
    
    private func refreshMapView() {
        guard let address = address else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = address
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response, let mapItem = response.mapItems.first {
                self.mapView.addMapItem(mapItem)
            }
        }
    }
    
}
