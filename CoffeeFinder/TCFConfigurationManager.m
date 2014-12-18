//
//  CFConfigurationManager.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFConfigurationManager.h"

@interface TCFConfigurationManager()

@property (nonatomic,strong) NSString * foursquareClientId;
@property (nonatomic,strong) NSString * foursquareClientSecret;

@end

@implementation TCFConfigurationManager

+(instancetype)sharedManager {
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
        [sharedManager acquireStoredData];
    });
    return sharedManager;
}

-(void)acquireStoredData {
    NSDictionary * storedData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AppConfig" ofType:@"plist"]];
    
    self.foursquareClientId = [storedData objectForKey:@"FSClientId"];
    self.foursquareClientSecret = [storedData objectForKey:@"FSClientSecret"];
}

@end
