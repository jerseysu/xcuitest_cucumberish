//
//  basepage.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/9.
//  Copyright © 2018 Mario Ban. All rights reserved.
//  Refers to : https://github.com/alexilyenko/SimpleIOSCalculator/blob/master/SimpleCalculatorUITests/PageObject/Screens/BaseScreen.swift
//

import XCTest

protocol Page {
}

extension Page {

    init(_ app: XCUIElement) {
        self.init(app)
        waitFor(element: app)
    }

    func findElement(_ type: XCUIElement.ElementType) -> XCUIElementQuery {
        return XCUIApplication().descendants(matching: type)
    }
    
    func step(_ name: String, block: (XCTActivity) -> Void) {
        XCTContext.runActivity(named: name, block: block)
    }
    
    func waitFor(element: XCUIElement) {
        let isExists = element.waitForExistence(timeout: 30)
        
        if(!isExists) {
            XCTFail("Fail to open page")
        }
    }
}
