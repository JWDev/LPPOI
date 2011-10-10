//
//  LPPOIMapAnnotation.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "LPPOIMapAnnotation.h"

#pragma mark -

@implementation LPPOIMapAnnotation

@synthesize coordinate = _coordinate;

#pragma mark - Memory Management

- (id) initWithCoordinate:(CLLocationCoordinate2D)c
{
    _coordinate = c;
	return self;
}

#pragma mark - Getters

- (NSString *)subtitle
{
	return nil;
}

- (NSString *)title
{
	return nil;
}


@end
