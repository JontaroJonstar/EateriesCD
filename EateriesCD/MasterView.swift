//
//  MasterView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import Foundation
import SwiftUI

struct MasterView: View {
    @ObservedObject var eat: Eat
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        List {
            ForEach(eat.entryArray) { entry in
                Text("\(entry.title ?? "")")
            }
            .onDelete(perform: deleteItems)
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: addItem) { Label("", systemImage: "plus")})
    }
    
    private func addItem() {
        withAnimation {
            let entry = Entry(context: viewContext)
            entry.title = "Entry #\(eat.entryArray.count + 1)"
            var entries = eat.entryArray
            entries.append(entry)
            eat.entries = NSOrderedSet (array: entries)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { eat.entryArray[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
