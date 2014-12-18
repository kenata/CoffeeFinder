//
//  TCFLocationManager.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/7/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol TCFLocationObserver <NSObject>

-(void)didChangeLocationAuthorizationStatus:(CLAuthorizationStatus)authStatus;

@end

@interface TCFLocationManager : NSObject

+(instancetype)sharedManager;

+(void)registerObserver:(id<TCFLocationObserver>)observer;

@end
