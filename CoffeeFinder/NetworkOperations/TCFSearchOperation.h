//
//  TCFSearchOperation.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFNetworkOperation.h"
#import <CoreLocation/CoreLocation.h>

@interface TCFSearchOperation : TCFNetworkOperation



-(instancetype)initWithLocation:(CLLocationCoordinate2D)location andRange:(CLLocationDegrees)degrees;



@end
