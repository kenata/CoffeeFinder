//
//  TCFFullVenueModel.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/11/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFCompactVenueModel.h"

@interface TCFFullVenueModel : TCFCompactVenueModel

@property (nonatomic,strong) NSString * hours;
@property (nonatomic) NSInteger rating;
@property (nonatomic,strong) NSString * storeDescription;
@property (nonatomic,strong) NSURL * canonicalUrl;
@property (nonatomic,strong) NSURL * menuUrl;

@end
