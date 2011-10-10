//
//  LPPOIMapAnnotation.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LPPOIMapAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
