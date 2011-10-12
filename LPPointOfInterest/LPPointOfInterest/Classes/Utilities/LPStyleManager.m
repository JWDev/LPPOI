//
//  LPStyleManager.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-11.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "LPStyleManager.h"

#import "UIColor+Additions.h"

@implementation LPStyleManager

#pragma mark - Fonts

+ (UIFont *)fontButtonTitle
{
    return [UIFont fontWithName:@"Helvetica" size:24];
}

+ (UIFont *)fontTitle
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:16];
}

+ (UIFont *)fontText
{
    return [UIFont fontWithName:@"Helvetica" size:16];
}

+ (UIFont *)fontCreditsTitle
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:28];
}

+ (UIFont *)fontCreditsText
{
    return [UIFont fontWithName:@"Helvetica" size:14];
}

#pragma mark - Fonts

+ (UIColor *)colorBackground
{
    return [UIColor colorWithHexString: @"0x113450" alpha:1.0];
}

+ (UIColor *)colorButtonNormalTitle
{
    return [UIColor colorWithHexString:@"0x17476D" alpha:1.0];
}

+ (UIColor *)colorButtonSelectedTitle
{
    return [UIColor yellowColor];
}

+ (UIColor *)colorTitle
{
    return [UIColor blackColor];
}

+ (UIColor *)colorText
{
    return [UIColor blackColor];
}

+ (UIColor *)colorCreditsTitle
{
    return [UIColor whiteColor];
}

+ (UIColor *)colorCreditsText
{
    return [UIColor whiteColor];
}

@end
