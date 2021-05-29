//
//  EateriesCDApp.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import SwiftUI

@main
struct EateriesCDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
