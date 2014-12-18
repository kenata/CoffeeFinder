//
//  TCFCategoryModel.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <Foundation/Foundation.h>

//TODO - P1: Create Serialization Mechanism for turning a particular dictionary into this model
//TODO - P1: Create a Controller to gather and maintain the relevant data models

@interface TCFCategoryModel : NSObject

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * pluralName;
@property (nonatomic,strong) NSString * shortName;
@property (nonatomic,strong) NSString * icon;
@property (nonatomic) BOOL primary;

@end
