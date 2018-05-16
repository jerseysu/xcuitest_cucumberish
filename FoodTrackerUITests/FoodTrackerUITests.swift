//
//  FoodTrackerUITests.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/7.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

import XCTest
import Foundation
import Cucumberish
@objc class CucumberishInitializer: NSObject {
    @objc class func CucumberishSwiftInit()
    {
        //Using XCUIApplication only available in XCUI test targets not the normal Unit test targets.
        var application : XCUIApplication!
        
        //A closure that will be executed only before executing any of your features
        beforeStart { () -> Void in
            //Any global initialization can go here
            application = XCUIApplication()
            StepDefinetion().setup(application)
        }
        
        //Create a bundle for the folder that contains your "Features" folder. In this example, the CucumberishInitializer.swift file is in the same directory as the "Features" folder.
        let bundle = Bundle(for: CucumberishInitializer.self)
        
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
        
        before { (scenario: CCIScenarioDefinition?) in
            application.launch()
        }
        
        after { (scenario: CCIScenarioDefinition?) in
            application.terminate()
        }
    }
}


