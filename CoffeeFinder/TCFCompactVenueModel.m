//
//  TCFCompactVenueModel.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/8/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFCompactVenueModel.h"

@implementation TCFCompactVenueModel

-(void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:NSStringFromSelector(@selector(location))]) {
        self.location = [[TCFLocation alloc] init];
        [self.location setValuesForKeysWithDictionary:value];
    } else if([key isEqualToString:NSStringFromSelector(@selector(id))]) {
        self.id = value;
    } else if ([key isEqualToString:NSStringFromSelector(@selector(name))]){
        self.name = value;
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

-(CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.location.lat, self.location.lng);
}

-(NSString*)title {
    return self.name;
}

@end
