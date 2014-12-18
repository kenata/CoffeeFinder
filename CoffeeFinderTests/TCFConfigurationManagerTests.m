//
//  TCFConfigurationManagerTests.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TCFConfigurationManager.h"

@interface TCFConfigurationManagerTests : XCTestCase

@end

@implementation TCFConfigurationManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testConfigurationManager {
    NSString * fsID = [[TCFConfigurationManager sharedManager] foursquareClientId];
    NSString * fsSecret = [[TCFConfigurationManager sharedManager] foursquareClientSecret];
    XCTAssert(fsID!=nil,@"Foursquare id did not return correctly");
    XCTAssert(fsSecret!=nil,@"Foursquare secret did not return correctly");
}

@end
