//
//  LocationViewModel+MapKit.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import MapKit
import Foundation
import SwiftUI

private var updateCount = 0
private var latitudeSpan = 0.01
private var longitudeSpan = 0.01

//extension containing lat/longSpan and region for Entry
extension Entry: MKMapViewDelegate {
    
    var coordinateSpan: MKCoordinateSpan {

        
        get { MKCoordinateSpan(latitudeDelta: latitudeSpan, longitudeDelta: longitudeSpan)}
        set {
            latitudeSpan = newValue.latitudeDelta
            longitudeSpan = newValue.longitudeDelta
        }

    }
    
    var region: MKCoordinateRegion {
        get { MKCoordinateRegion(center: coordinates, span: coordinateSpan)}
        set { coordinateSpan = newValue.span }
    }
    
    // func that allows the app the 'wait' for 500milliseconds before calling/updating, this is to allow for coordinate entry without interuption
    @objc public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        self.region = MKCoordinateRegion(center: self.coordinates, span: self.coordinateSpan)
        updateCount += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + . milliseconds(500)) {
            
            updateCount -= 1
            guard updateCount == 0 else { return }
            self.coordinates = centre
        }
    }
}
