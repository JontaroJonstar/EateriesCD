//
//  MapView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import SwiftUI
import MapKit
import UIKit


struct MapView: UIViewRepresentable {
    
    
    @ObservedObject var entry: Entry
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = entry
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(entry.region, animated: true)
    }


}

