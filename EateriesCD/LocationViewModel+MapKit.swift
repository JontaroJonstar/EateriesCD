//
//  LocationViewModel+MapKit.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import MapKit

extension LocationViewModel {
    
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
}
