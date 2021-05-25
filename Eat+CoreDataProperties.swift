//
//  Eat+CoreDataProperties.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//
//

import Foundation
import CoreData


extension Eat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eat> {
        return NSFetchRequest<Eat>(entityName: "Eat")
    }

    @NSManaged public var name: String?
    @NSManaged public var entries: NSOrderedSet?

}

// MARK: Generated accessors for entries
extension Eat {

    @objc(insertObject:inEntriesAtIndex:)
    @NSManaged public func insertIntoEntries(_ value: Entry, at idx: Int)

    @objc(removeObjectFromEntriesAtIndex:)
    @NSManaged public func removeFromEntries(at idx: Int)

    @objc(insertEntries:atIndexes:)
    @NSManaged public func insertIntoEntries(_ values: [Entry], at indexes: NSIndexSet)

    @objc(removeEntriesAtIndexes:)
    @NSManaged public func removeFromEntries(at indexes: NSIndexSet)

    @objc(replaceObjectInEntriesAtIndex:withObject:)
    @NSManaged public func replaceEntries(at idx: Int, with value: Entry)

    @objc(replaceEntriesAtIndexes:withEntries:)
    @NSManaged public func replaceEntries(at indexes: NSIndexSet, with values: [Entry])

    @objc(addEntriesObject:)
    @NSManaged public func addToEntries(_ value: Entry)

    @objc(removeEntriesObject:)
    @NSManaged public func removeFromEntries(_ value: Entry)

    @objc(addEntries:)
    @NSManaged public func addToEntries(_ values: NSOrderedSet)

    @objc(removeEntries:)
    @NSManaged public func removeFromEntries(_ values: NSOrderedSet)

}

extension Eat : Identifiable {

}
