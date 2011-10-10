//
//  LPPOIMainMenuViewController.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LPPOIMainMenuViewController : UIViewController 
{
    UIImageView* _imageView;
    NSTimer* _timer;
    
    UIButton* _poiButton;
    UIButton* _creditsButton;
    
@private
    NSUInteger currentImageIndex;
}

@property (nonatomic, retain) NSTimer* timer;;
@property (nonatomic, retain) UIImageView* imageView;
@property (nonatomic, retain) UIButton* poiButton;
@property (nonatomic, retain) UIButton* creditsButton;


@end
