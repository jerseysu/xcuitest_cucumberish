//
//  MainPage.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/16.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

import XCTest

class MainPage: Page {
    private lazy var meals = findElement(.table).cells.staticTexts
    private lazy var title = findElement(.navigationBar)["Your Meals"].firstMatch
    private lazy var mealNameWithRating = findElement(.staticText)
    
    required init() {
        waitFor(element: title)
    }
    
    @discardableResult func selectMealByName(_ mealName: String) -> MainPage{
        meals[mealName].tap()
        return self
    }
    
    @discardableResult func compareRating(_ mealName: String, _ mealRating: String) -> MainPage{
        XCTAssertEqual(mealNameWithRating[mealName].label, mealRating)
        return self
    }
}
