//
//  ContentView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import SwiftUI
import CoreData


// struct for the Contents of the App (opening view)
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Eat.name, ascending: true)],
        animation: .default)
    private var eats: FetchedResults<Eat>
    var body: some View {
        NavigationView {
            MasterView(eat: eats.first ?? Eat(context:viewContext))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
