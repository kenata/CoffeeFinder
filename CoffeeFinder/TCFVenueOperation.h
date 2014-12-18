//
//  TCFVenueOperation.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/11/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFNetworkOperation.h"

@interface TCFVenueOperation : TCFNetworkOperation

-(instancetype)initWithId:(NSString*)venueId;

@end
