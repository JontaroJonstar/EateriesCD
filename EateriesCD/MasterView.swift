//
//  MasterView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import Foundation
import SwiftUI

extension String {
    func load() -> UIImage {
        // function that allows for URL to image conversion
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

struct MasterView: View {
    @ObservedObject var eat: Eat
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List {
            ForEach(eat.entryArray) { ent in
//                Text("\(entry.title ?? "")")
//                Text("\(entry.location ?? "")")
//                Text("\(entry.image ?? "")")
                NavigationLink(
                    destination: DetailsView(entry: ent),
                    label: { RowView( entry: ent)
             
                    })
            }
            .onMove {
                //onMove function, which allows moving of entries in EditMode
                eat.entryArray.move(fromOffsets: $0, toOffset: $1)
        }
            .onDelete(perform: deleteItems)
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: addItem) { Label("", systemImage: "plus")})
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Eateries")
    }
    
    
    private func addItem() {
        //function that appends an entry to the entryArray
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
        //function that deletes the selected entry from the entryArray
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
