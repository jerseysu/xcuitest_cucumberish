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
            application.launch()
        }
        
        //Another step definition
        MatchAll("tap Caprese Salad") { (args, userInfo) -> Void in
            //Assume you defined an "I tap on \"(.*)\" button" step previousely, you can call it from your code as well.
            //let testCase = userInfo?[kXCTestCaseKey] as? XCTestCase
            //SStep(testCase, "I tap the \"Clear All Data\" button")
            application.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Caprese Salad"]/*[[".cells.staticTexts[\"Caprese Salad\"]",".staticTexts[\"Caprese Salad\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
            //            application.navigationBars["Caprese Salad"].buttons["Cancel"].tap()
        }
        
        MatchAll("I should see Caprese Salad") { (args, userInfo) -> Void in
            //Assume you defined an "I tap on \"(.*)\" button" step previousely, you can call it from your code as well.
            //let testCase = userInfo?[kXCTestCaseKey] as? XCTestCase
            //SStep(testCase, "I tap the \"Clear All Data\" button")
            
            XCTAssertTrue(application.otherElements["Caprese Salad"].exists)
        }
        
        
    }
    
    class func setup(_ application: XCUIApplication)
    {
        StepDefinetion().setup(application)
    }
}
