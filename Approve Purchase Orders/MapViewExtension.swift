//
//  MapViewExtension.swift
//  Approve Purchase Orders
//
//  Created by Robert Witt on 18.01.19.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    
    func addMapItem(_ mapItem: MKMapItem) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(mapItem.placemark.coordinate.latitude, mapItem.placemark.coordinate.longitude)
        addAnnotation(annotation)
        
        register(SupplierAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let region = MKCoordinateRegion(center: mapItem.placemark.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        setRegion(region, animated: false)
    }
    
}
