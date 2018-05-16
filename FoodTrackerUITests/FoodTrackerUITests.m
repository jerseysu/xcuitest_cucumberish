//
//  FoodTrackerUITests.m
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/7.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

#import <Foundation/Foundation.h>
//Replace CucumberishExampleUITests with the name of your swift test target
#import "FoodTrackerUITests-Swift.h"
__attribute__((constructor))
void CucumberishInit()
{
    [CucumberishInitializer CucumberishSwiftInit];
}
