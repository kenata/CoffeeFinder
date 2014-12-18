//
//  TCFLocationManager.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/7/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFLocationManager.h"
@interface TCFLocationManager () <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager * locationManager;
@property (nonatomic,strong) NSHashTable * observers;

@end

@implementation TCFLocationManager

+(instancetype) sharedManager {
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

+(void)registerObserver:(id<TCFLocationObserver>)observer {
    [[TCFLocationManager sharedManager].observers addObject:observer];
}

-(instancetype) init {
    if(self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.observers = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

-(void)setLocationManager:(CLLocationManager *)locationManager {
    _locationManager = locationManager;
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    for(id<TCFLocationObserver> observer in self.observers) {
        if([observer respondsToSelector:@selector(didChangeLocationAuthorizationStatus:)]) {
            [observer didChangeLocationAuthorizationStatus:status];
        }
    }
}

@end
