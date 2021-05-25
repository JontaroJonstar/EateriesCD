//
//  MapScreen.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import SwiftUI



struct MapScreen: View {
    @ObservedObject var entry: Entry
    
    var body: some View {
        VStack{
            VStack{
                TextField("Enter name", text: $entry.name ?? "default value", onCommit: {entry.lookupPosition() })
                TextField("Enter name", text: $entry.latitudeString, onCommit: {entry.lookupName() })
                TextField("Enter name", text: $entry.longitudeString, onCommit: {entry.lookupName() })
            }.padding()
            MapView(entry: entry)
        }
        
    }
}

