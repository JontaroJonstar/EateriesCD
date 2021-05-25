//
//  LocationViewModel+CoreLocation.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import CoreLocation

private var isGeoCoding = false

extension Location {
    
    var location: CLLocation {
        get { CLLocation(latitude: latitude, longitude: longitude) }
        set {
            latitude = newValue.coordinate.latitude
            longitude = newValue.coordinate.longitude
        }
    }
    
    var coordinates: CLLocationCoordinate2D {
        get { CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
    
    
    func lookupName() {
        guard !isGeoCoding else { return }
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first else {
                if let error = $1 {
                    print("Error looking up location \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
            }
            self.name = placeMark.name ?? placeMark.locality ?? placeMark.subLocality ?? placeMark.administrativeArea ?? placeMark.country ?? "<unknown>"
        }
    }
    
    func lookupPosition() {
        guard !isGeoCoding else { return }
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(name ?? "") {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first,
                let coordinates = placeMark.location?.coordinate else {
                if let error = $1 {
                    print("Error looking up location \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
        }
            self.latitude = coordinates.latitude
            self.longitude = coordinates.longitude
        
    }
}
    
}
