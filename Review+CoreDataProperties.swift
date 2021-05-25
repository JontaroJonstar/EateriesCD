//
//  Review+CoreDataProperties.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var author: String?
    @NSManaged public var review: String?
    @NSManaged public var entry: Entry?

}
