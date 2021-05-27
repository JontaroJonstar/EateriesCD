//
//  Entry+CoreDataProperties.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 28/5/21.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var image: String?
    @NSManaged public var latitude: Double
    @NSManaged public var locations: String?
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var title: String?
    @NSManaged public var latitudeSpan: Double
    @NSManaged public var longitudeSpan: Double
    @NSManaged public var eats: Eat?
    @NSManaged public var reviews: NSOrderedSet?

}

// MARK: Generated accessors for reviews
extension Entry {

    @objc(insertObject:inReviewsAtIndex:)
    @NSManaged public func insertIntoReviews(_ value: Review, at idx: Int)

    @objc(removeObjectFromReviewsAtIndex:)
    @NSManaged public func removeFromReviews(at idx: Int)

    @objc(insertReviews:atIndexes:)
    @NSManaged public func insertIntoReviews(_ values: [Review], at indexes: NSIndexSet)

    @objc(removeReviewsAtIndexes:)
    @NSManaged public func removeFromReviews(at indexes: NSIndexSet)

    @objc(replaceObjectInReviewsAtIndex:withObject:)
    @NSManaged public func replaceReviews(at idx: Int, with value: Review)

    @objc(replaceReviewsAtIndexes:withReviews:)
    @NSManaged public func replaceReviews(at indexes: NSIndexSet, with values: [Review])

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSOrderedSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSOrderedSet)

}
