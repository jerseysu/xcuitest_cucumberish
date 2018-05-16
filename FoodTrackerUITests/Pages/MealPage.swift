//
//  MealPage.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/16.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

import XCTest

class MealPage: Page {
    private lazy var meals = findElement(.table).cells.staticTexts
    private lazy var ratingController = findElement(.other)["ratingControl"]
    private lazy var saveButton = findElement(.button)["Save"]
    
    required init() {
        waitFor(element: saveButton)
    }
    
    @discardableResult func rating(_ rating: Int) -> MealPage{
        ratingController.buttons.element(boundBy: rating).tap()
        return self
    }
    
    @discardableResult func saveMeal() -> MealPage{
        saveButton.tap()
        return self
    }
}
