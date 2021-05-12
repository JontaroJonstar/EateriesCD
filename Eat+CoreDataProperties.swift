//
//  Eat+CoreDataProperties.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//
//

import Foundation
import CoreData


extension Eat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eat> {
        return NSFetchRequest<Eat>(entityName: "Eat")
    }

    @NSManaged public var name: String?
    @NSManaged public var entries: NSSet?

}

// MARK: Generated accessors for entries
extension Eat {

    @objc(addEntriesObject:)
    @NSManaged public func addToEntries(_ value: Entry)

    @objc(removeEntriesObject:)
    @NSManaged public func removeFromEntries(_ value: Entry)

    @objc(addEntries:)
    @NSManaged public func addToEntries(_ values: NSSet)

    @objc(removeEntries:)
    @NSManaged public func removeFromEntries(_ values: NSSet)

}

extension Eat : Identifiable {

}
