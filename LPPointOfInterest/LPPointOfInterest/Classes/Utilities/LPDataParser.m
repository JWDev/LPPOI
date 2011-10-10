//
//  LPDataParser.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//

#import "LPDataParser.h"

#import "NSObject+SBJson.h"

#pragma mark -

@implementation LPDataParser

+ (NSDictionary *) dictionaryFromJSONString: (NSString *)jsonString
{
    return [jsonString JSONValue];
}

+ (NSDictionary *) dictionaryFromXMLString: (NSString *)jsonString
{
    NSAssert(YES, @"ERROR: This method should not be called until it's implemented.");
    
    // TODO: Finish this when needed.
    return nil;
}


@end
