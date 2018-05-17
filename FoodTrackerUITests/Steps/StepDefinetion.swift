//
//  switch_steps.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/15.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

import XCTest
import Cucumberish

class StepDefinetion: NSObject {
    
    var application : XCUIApplication!
    
    func setup(_ application: XCUIApplication)
    {
        self.application = application
        
        //A Given step definition
        Given("the app is running") { (args, userInfo) -> Void in
            application.launchArguments.append("--UITests")
            application.launch()
        }
        
        //Another step definition
        MatchAll("I select \"([^\\\"]*)\"") { (args, userInfo) -> Void in
            let mealName = args?[0]
            MainPage().selectMealByName(mealName!)
        }
        
        MatchAll("I should see Caprese Salad") { (args, userInfo) -> Void in
            //Assume you defined an "I tap on \"(.*)\" button" step previousely, you can call it from your code as well.
            //let testCase = userInfo?[kXCTestCaseKey] as? XCTestCase
            //SStep(testCase, "I tap the \"Clear All Data\" button")
            
            XCTAssertTrue(application.otherElements["Caprese Salad"].exists)
        }
        
        MatchAll("I rating as ([1-9]*)") { (args, userInfo) -> Void in
            
            let mealRating = (NSString(string: (args?[0])!).integerValue - 1)
            MealPage().rating(mealRating).saveMeal()
        }
        
        MatchAll("I should see \"([^\\\"]*)\" rating as ([1-9]*)") { (args, userInfo) -> Void in
            
            let mealName = args?[0]
            let mealRating = String((NSString(string: (args?[1])!).integerValue))
            MainPage().compareRating(mealName!, mealRating)
        }
    }
    
    class func setup(_ application: XCUIApplication)
    {
        StepDefinetion().setup(application)
    }
}
