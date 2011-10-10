//
//  LPPointOfInterestAppDelegate.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LPPOITableViewController;

@interface LPPointOfInterestAppDelegate : NSObject <UIApplicationDelegate> 
{
    UINavigationController* _navigationController;
    LPPOITableViewController* _poiTableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController* navigationController;
@property (nonatomic, retain) LPPOITableViewController* poiTableViewController;

@end
