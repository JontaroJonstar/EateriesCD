//
//  EateriesCDTests.swift
//  EateriesCDTests
//
//  Created by Johnson Taylor on 13/5/21.
//

import XCTest
@testable import EateriesCD

class EateriesCDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddReview() throws {
        
        
    }
    
    private func addReview() {
        withAnimation {
            let review = Review(context: viewContext)
            review.author = "New Author"
            review.review = "Review #\(entry.reviewArray.count + 1)"
            var reviews = entry.reviewArray
            reviews.append(review)
            entry.reviews = NSOrderedSet (array: reviews)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

}
