//
//  TCFVenueOperation.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/11/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFVenueOperation.h"

@interface TCFVenueOperation ()

@property (nonatomic,strong) NSString * venueId;

@end

@implementation TCFVenueOperation

-(instancetype)initWithId:(NSString*)venueId {
    if(self = [super init]) {
        self.venueId = venueId;
    }
    
    return self;
}

-(NSString*)apiPath {
    return [NSString stringWithFormat:@"venues/%@",self.venueId];
}

-(void)handleResponse:(NSDictionary *)response {
    NSArray* top = response[@"venues"];
}

@end
