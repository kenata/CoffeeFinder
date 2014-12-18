//
//  TCFCompactVenueModel.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/8/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCFLocation.h"
#import <MapKit/MapKit.h>

@interface TCFCompactVenueModel : NSObject <MKAnnotation>

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) TCFLocation * location;

@end
