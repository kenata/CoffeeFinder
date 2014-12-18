//
//  TCFSearchOperation.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFSearchOperation.h"
#import "TCFCompactVenueModel.h"

@interface TCFSearchOperation ()

@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic) CLLocationDegrees range;

@end

@implementation TCFSearchOperation

-(instancetype)initWithLocation:(CLLocationCoordinate2D)location andRange:(CLLocationDegrees)degrees {
    if(self = [super init]) {
        self.location = location;
        self.range = degrees;
    }
    
    return self;
}

-(NSString*)apiPath {
    return @"venues/search";
}

-(NSString*)queryString {
    NSMutableString * string = [NSMutableString string];
    if(self.location.longitude!=0 && self.location.latitude!=0) {
        [string appendFormat:@"&ll=%f,%f",self.location.latitude,self.location.longitude];
    }
    if(self.categoryId) {
        [string appendFormat:@"&categoryId=%@",self.categoryId];
    }
    [string appendString:@"&intent=browse"];
    float radius = (self.range*33300);
    [string appendFormat:@"&radius=%f",radius];
    return string;
}

-(NSString*)categoryId {
    return @"4bf58dd8d48988d1e0931735";
}

-(void)handleResponse:(NSDictionary *)response {
    NSArray* top = response[@"venues"];
    NSMutableDictionary * output = [NSMutableDictionary dictionary];
    for(NSDictionary * dict in top) {
        TCFCompactVenueModel * model = [[TCFCompactVenueModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [output setObject:model forKey:model.id];
    }
    [super handleResponse:output];
}

@end
