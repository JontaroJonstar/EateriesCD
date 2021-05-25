////
////  LocationViewModel.swift
////  EateriesCD
////
////  Created by Johnson Taylor on 26/5/21.
////
//
//import Foundation
//import SwiftUI
//
//
//
//class LocationViewModel: NSObject, ObservableObject {
////    @ObservedObject var entry: Entry
//    @Environment(\.managedObjectContext) private var viewContext
//    @Published var model: Location
//    @Published var latitudeSpan = 0.1
//    @Published var longitudeSpan = 0.1
//    
//    init(name: String, latitude: Double, longitude: Double) {
//        model = Location(context: viewContext)
//    }
//    
//    var latitudeString: String {
//        get { "\(model.latitude)" }
//        set {
//            guard let doubleValue = Double(newValue) else { return }
//            model.latitude = doubleValue
//        }
//    }
//    
//    var longitudeString: String {
//        get { "\(model.longitude)" }
//        set {
//            guard let doubleValue = Double(newValue) else { return }
//            model.longitude = doubleValue
//        }
//    }
//    
//
//    
//
//}
