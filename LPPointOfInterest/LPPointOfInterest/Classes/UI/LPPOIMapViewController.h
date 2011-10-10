//
//  LPPOIMapViewController.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//
//
//  DESIGN
//  Shows a map view of the currently selected point of interest.

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LPPOIMapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView* _mapView;
    
@private
    NSDictionary* _dataDict;
}

@property (nonatomic, retain) NSDictionary* dataDict;
@property (nonatomic, retain) MKMapView* mapView;

- (id) initWithDictionary:(NSDictionary *)dict;

@end
