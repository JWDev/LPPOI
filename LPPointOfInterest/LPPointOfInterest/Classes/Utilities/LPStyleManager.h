//
//  LPStyleManager.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-11.
//  Copyright 2011 Team Pixel. All rights reserved.
//
//
//  DESIGN
//  Static class used to style the app, allowing for easy replacement if another look is desired.


#import <Foundation/Foundation.h>


@interface LPStyleManager : NSObject 
{
    
}

#pragma mark - Fonts

+ (UIFont *)fontButtonTitle;

+ (UIFont *)fontDetailsTitle;
+ (UIFont *)fontDetailsText;

+ (UIFont *)fontCreditsTitle;
+ (UIFont *)fontCreditsText;

#pragma mark - Colors

+ (UIColor *)colorBackground;

+ (UIColor *)colorButtonNormalTitle;
+ (UIColor *)colorButtonSelectedTitle;

+ (UIColor *)colorDetailsTitle;
+ (UIColor *)colorDetailsText;

+ (UIColor *)colorCreditsTitle;
+ (UIColor *)colorCreditsText;

@end
