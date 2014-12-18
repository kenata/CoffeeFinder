//
//  TCFNetworkOperation.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/6/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFNetworkOperation.h"
#import "TCFConfigurationManager.h"

@interface TCFNetworkOperation () <NSURLConnectionDataDelegate>

@end

@implementation TCFNetworkOperation

-(void)start {
    NSURL * url = [NSURL URLWithString:self.operationPath];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    NSURLConnection * conn = [NSURLConnection connectionWithRequest:req delegate:self];
    
    [conn start];
    
}

-(NSString*)operationPath {
    return [NSString stringWithFormat:@"%@%@%@%@",self.basePath,self.apiPath,self.appIdentifiers,self.queryString];
}

-(NSString*)basePath {
    return @"https://api.foursquare.com/v2/";
}

-(NSString*)appIdentifiers {
    return [NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=20141206&m=foursquare",[[TCFConfigurationManager sharedManager] foursquareClientId],[[TCFConfigurationManager sharedManager] foursquareClientSecret]];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSDictionary * output = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [self handleResponse:output[@"response"]];
}

-(void)handleResponse:(NSDictionary*)response
{
    if(self.responseBlock) {
        self.responseBlock(response);
    }
}

@end
