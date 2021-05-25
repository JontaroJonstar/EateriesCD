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
    @ObservedObject var viewModel: LocationViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(viewModel.region, animated: true)
    }

}

