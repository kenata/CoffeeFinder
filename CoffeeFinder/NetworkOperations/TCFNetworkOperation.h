//
//  TCFNetworkOperation.h
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCFNetworkOperation : NSOperation

@property (nonatomic,readonly) NSString * apiPath;
@property (nonatomic,readonly) NSString * queryString;
@property (copy) void (^responseBlock)(NSDictionary * output);

-(void)handleResponse:(NSDictionary*)response;

@end
