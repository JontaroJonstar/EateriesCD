//
//  EateriesCDApp.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import SwiftUI

@main
struct EateriesCDApp: App {
    @StateObject var viewModel: LocationViewModel = LocationViewModel(name: "Brisbane", latitude: 153.026, longitude: -27.4)
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
