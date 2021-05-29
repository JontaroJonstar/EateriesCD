//
//  MasterView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension String {
    // function that allows for URL to image conversion
    func load() -> UIImage {
        do {
            // convert string to URL
            guard let url = URL(string: self)
                else{
            //return empty image if URL is invalid
                return UIImage()
                
            }
            let data: Data = try
                Data(contentsOf: url)
            
            return UIImage(data: data)
                ?? UIImage()
            
        } catch {
            
        }
        
        return UIImage()
    }
}

// struct for the Entry list (used in ContentView)
struct MasterView: View {
    @ObservedObject var eat: Eat
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List {
            ForEach(eat.entryArray) { ent in

                NavigationLink(
                    destination: DetailsView(entry: ent),
                    label: { RowView( entry: ent)
             
                    })
            }
            //onMove function, which allows moving of entries in EditMode
            .onMove {
                eat.entryArray.move(fromOffsets: $0, toOffset: $1)
            }
            // func that allows for deletion of Entry during editMode
            .onDelete(perform: deleteItems)
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: addItem) { Label("", systemImage: "plus")})
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Eateries")
    }
    
    //function that appends an entry to the entryArray
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
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //function that deletes the selected entry from the entryArray
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { eat.entryArray[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        
    }
}
