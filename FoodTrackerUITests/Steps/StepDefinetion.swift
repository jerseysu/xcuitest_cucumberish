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
            MainPage().checkMainPage()
        }
        
        //Another step definition
        MatchAll("I select \"([^\\\"]*)\"") { (args, userInfo) -> Void in
            let mealName = args?[0]
            MainPage().selectMealByName(mealName!)
        }
        
        MatchAll("I should see \"([^\\\"]*)\"") { (args, userInfo) -> Void in
            let mealName = args?[0]
            MealPage().checkMeal(mealName!)
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
