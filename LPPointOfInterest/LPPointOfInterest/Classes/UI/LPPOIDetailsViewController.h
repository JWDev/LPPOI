//
//  LPPOIDetailsViewController.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 JWDev. All rights reserved.
//
//
//  DESIGN
//  Displays the point of interest's details (name, address, phone, review, etc.).


#import <UIKit/UIKit.h>


@interface LPPOIDetailsViewController : UIViewController 
{
    // Views
    UILabel* nameTitleLabel;
    UILabel* typeTitleLabel;
    UILabel* addressTitleLabel;
    UILabel* reviewTitleLabel;

    UILabel* nameTextLabel;
    UILabel* typeTextLabel;
    UILabel* address1TextLabel;
    UILabel* address2TextLabel;

    UIWebView* reviewWebview;

@private
    NSDictionary* _dataDict;
}

@property (nonatomic, retain) NSDictionary* dataDict;

- (id) initWithDictionary:(NSDictionary *)dict;

@end
