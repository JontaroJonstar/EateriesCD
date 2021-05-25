//
//  LocationViewModel+MapKit.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import MapKit

private var updateCount = 0
private var latitudeSpan = 0.1
private var longitudeSpan = 0.1

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
    
    @objc public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        updateCount += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + . milliseconds(250)) {
            updateCount -= 1
            guard updateCount == 0 else { return }
            self.coordinates = centre
        }
    }
}
