//
//  NSDictionary+Additions.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//
//
//  DESIGN
//  Used when parsing JSON into Core Data assuring the type of the resulting Object.

#import <Foundation/Foundation.h>


@interface NSDictionary(LPAdditions)

- (NSString *)stringForKey:(id)aKey;

- (NSNumber *)numberFromBoolForKey:(id)aKey;
- (NSNumber *)numberFromIntForKey:(id)aKey;
- (NSNumber *)numberFromFloatForKey:(id)aKey;

- (NSArray *)arrayForKey:(id)aKey;

- (NSDictionary *)dictionaryForKey:(id)aKey;

@end
