//
//  LPPOICreditsViewController.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LPPOICreditsViewController : UIViewController 
{
    UILabel* _nameLabel;
    UILabel* _copyrightDateLabel;
}

@property (nonatomic, retain) UILabel* nameLabel;
@property (nonatomic, retain) UILabel* copyrightDateLabel;

@end
