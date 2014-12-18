//
//  TCFLocation.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/8/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFLocation.h"

@implementation TCFLocation

-(void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"lat"]) {
        self.lat = [value doubleValue];
    } else if([key isEqualToString:@"lng"]) {
        self.lng = [value doubleValue];
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

@end
