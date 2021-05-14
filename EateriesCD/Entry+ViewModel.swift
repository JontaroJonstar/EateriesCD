//
//  Entry+ViewModel.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 14/5/21.
//

import Foundation
import CoreData

extension Entry {
    var reviewArray: [Review] {
        get { reviews?.array as? [Review] ?? [] }
        set { reviews = NSOrderedSet(array: newValue)}
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func deleteReviews(offsets: IndexSet) {
        //function that deletes the selected entry from the entryArray
            offsets.map { reviewArray[$0] }.forEach(viewContext.delete)

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



