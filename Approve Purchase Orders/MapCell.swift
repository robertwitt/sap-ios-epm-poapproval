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
    
    // MARK: Properties & Outlets
    var address: String?
    
    @IBOutlet weak var mapView: MKMapView!
    
    static let reuseIdentifier = "MapCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
