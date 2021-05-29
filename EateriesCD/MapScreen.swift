//
//  MapScreen.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import SwiftUI


// struct that controls the MapScreen layout/formatting
struct MapScreen: View {
    @ObservedObject var entry: Entry
    
    var body: some View {
        VStack{
            VStack{
                TextField("Enter name", text: $entry.name ?? "Location Name", onCommit: {entry.lookupPosition() })
                TextField("Enter name", text: $entry.latitudeString, onCommit: {entry.lookupName() })
                TextField("Enter name", text: $entry.longitudeString, onCommit: {entry.lookupName() })
            }.padding()
            MapView(entry: entry)
                .overlay(InfoView(entry: entry), alignment: .topTrailing)
        }
        
    }
}

// struct that controls the overlay(image) used in MapScreen
struct InfoView: View {
    @ObservedObject var entry: Entry
    var body: some View {
        
        Image(uiImage: "\(entry.image ?? "")".load())
            
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .scaledToFit()
            .overlay(Circle()
                   .strokeBorder(Color.blue,lineWidth: 2))
            .padding()
                   
    }
}

