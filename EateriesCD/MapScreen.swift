//
//  MapScreen.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import SwiftUI

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct MapScreen: View {
    @ObservedObject var entry: Entry
    
    var body: some View {
        VStack{
            TextField("Enter name", text: $entry.locationL.name ?? "default value", onCommit: {entry.locationL?.lookupPosition() })
        }
        
    }
}

