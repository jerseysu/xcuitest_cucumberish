//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Mario Ban on 17.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

  /*
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.

  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.

    super.tearDown()
  }

  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.

    }
  }
  */

  // MARK: FoodTracker Tests

  // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
  func testMealInitialization() {
    // Success case.
    let potentialItem1 = Meal(name: "Newest meal, 0 stars", photo: nil, rating: 0)
    XCTAssertNotNil(potentialItem1)

    let potentialItem2 = Meal(name: "Newest meal, 5 stars", photo: nil, rating: 5)
    XCTAssertNotNil(potentialItem2)

    // Failure cases.
    let noName = Meal(name: "", photo: nil, rating: 0)
    XCTAssertNil(noName, "Empty name is invalid")

    let badRating1 = Meal(name: "Really bad rating", photo: nil, rating: -1)
    XCTAssertNil(badRating1, "Negative ratings are invalid, be positive")

    let badRating2 = Meal(name: "Really bad rating", photo: nil, rating: 6)
    XCTAssertNil(badRating2, "Maximum rating exceeded")
  }

}
