//
//  Location+ViewModel.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import Foundation
import CoreData

//extension containing latitude and longitude for Entry
extension Entry {

    var latitudeString: String {
        get { "\(latitude)" }
        set {
            guard let doubleValue = Double(newValue) else { return }
            latitude = doubleValue
        }
    }
    
    var longitudeString: String {
        get { "\(longitude)" }
        set {
            guard let doubleValue = Double(newValue) else { return }
            longitude = doubleValue
        }
    }
    

    

}
