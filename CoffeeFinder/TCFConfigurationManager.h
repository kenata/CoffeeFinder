//
//  TCFConfigurationManager.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCFConfigurationManager : NSObject

+(instancetype)sharedManager;

@property (nonatomic,readonly) NSString * foursquareClientId;
@property (nonatomic,readonly) NSString * foursquareClientSecret;

@end
