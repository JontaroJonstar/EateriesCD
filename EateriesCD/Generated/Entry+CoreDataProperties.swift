//
//  Entry+CoreDataProperties.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var notes: String?
    @NSManaged public var image: String?
    @NSManaged public var id: UUID?
    @NSManaged public var review: NSSet?

}

// MARK: Generated accessors for review
extension Entry {

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: Review)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: Review)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSSet)

}

extension Entry : Identifiable {

}
