//
//  UIColor+Additions.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "UIColor+Additions.h"


@implementation UIColor(LPAdditions)

+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha 
{
	UIColor *returnColor;
	
	if (string)	{
		NSScanner *scanner = [NSScanner scannerWithString:string];
		[scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
		
		unsigned hexNum;
		if(![scanner scanHexInt:&hexNum]) 
            hexNum = 0;
        
		int r = (hexNum >> 16) & 0xFF;
		int g = (hexNum >> 8) & 0xFF;
		int b = (hexNum) & 0xFF;
		
		returnColor = [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:alpha];		
	} else {
		returnColor = [UIColor lightGrayColor];
	}
	
	return returnColor;
}

@end
