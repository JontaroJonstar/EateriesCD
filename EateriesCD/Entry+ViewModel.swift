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
    
    //function that deletes the selected entry from the entryArray
    func deleteReviews(offsets: IndexSet) {
            offsets.map { reviewArray[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }



