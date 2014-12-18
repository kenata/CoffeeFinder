//
//  TCFCategoriesOperation.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFCategoriesOperation.h"
#import "TCFCategoryModel.h"

@implementation TCFCategoriesOperation

-(NSString*)apiPath {
    return @"venues/categories";
}

-(void)handleResponse:(NSDictionary*)response {
    NSArray* top = response[@"categories"];
    NSMutableDictionary * output = [NSMutableDictionary dictionary];
    for(NSDictionary * dict in top) {
        TCFCategoryModel * model = [[TCFCategoryModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [output setObject:model forKey:model.id];
    }
    [super handleResponse:output];
}

@end
