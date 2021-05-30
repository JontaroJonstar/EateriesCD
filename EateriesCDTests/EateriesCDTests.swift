//
//  EateriesCDTests.swift
//  EateriesCDTests
//
//  Created by Johnson Taylor on 13/5/21.
//

import XCTest
import CoreData
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
        var reviewsA = [""]
        let review = "Review"
        XCTAssertEqual(reviewsA.count, 1)
        reviewsA.append(review)
        XCTAssertEqual(reviewsA.count, 2)
        reviewsA.append(review)
        reviewsA.append(review)
        XCTAssertEqual(reviewsA.count, 4)
        XCTAssertEqual(reviewsA[0], "")
        XCTAssertEqual(reviewsA[1], "Review")
        XCTAssertEqual(reviewsA[3], "Review")
    }
}



