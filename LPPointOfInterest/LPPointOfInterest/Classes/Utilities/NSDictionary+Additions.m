//
//  NSDictionary+Additions.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//

#import "NSDictionary+Additions.h"


@implementation NSDictionary(LPAdditions)

- (NSString *)stringForKey:(id)aKey
{
	NSString* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSString class]]) {
        result = item;
    } else if ([item respondsToSelector:@selector(description)]) {
        result = [item description];
    }
	
	return result;
}

- (NSNumber *)numberFromBoolForKey:(id)aKey
{
	NSNumber* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSNumber class]]) {
        result = item;
    } else if ([item respondsToSelector:@selector(boolValue)]) {
        result = [NSNumber numberWithBool:[item boolValue]];
    }
	
	return result;
}

- (NSNumber *)numberFromIntForKey:(id)aKey
{
	NSNumber* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSNumber class]]) {
        result = item;
    } else if ([item respondsToSelector:@selector(intValue)]) {
        result = [NSNumber numberWithInt:[item intValue]];
    }
	
	return result;
}

- (NSNumber *)numberFromFloatForKey:(id)aKey
{
	NSNumber* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSNumber class]]) {
        result = item;
    } else if ([item respondsToSelector:@selector(floatValue)]) {
        result = [NSNumber numberWithFloat:[item floatValue]];
    }
	
	return result;
}

- (NSArray *)arrayForKey:(id)aKey
{
	NSArray* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSArray class]]) {
        result = item;
    }
	
	return result;
}

- (NSDictionary *)dictionaryForKey:(id)aKey
{
	NSDictionary* result = nil;
	
	id item = [self objectForKey:aKey];
	if ([item isKindOfClass:[NSDictionary class]]) {
        result = item;
    }
	
	return result;
}

@end
