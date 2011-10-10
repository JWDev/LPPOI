//
//  LPPOIDetailsViewController.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 JWDev. All rights reserved.
//

#import "LPPOIDetailsViewController.h"

#import "NSDictionary+Additions.h"

#import <QuartzCore/QuartzCore.h>

#pragma mark -

@interface LPPOIDetailsViewController() 
- (UIFont *)titleFont;
- (UIFont *)textFont;

- (UIColor *)titleColor;
- (UIColor *)textColor;

- (UILabel *) titleLabel:(NSString *)title atPoint:(CGPoint)origin;
- (UILabel *) textLabel:(NSString *)text atPoint:(CGPoint)origin;
@end

#pragma mark -

@implementation LPPOIDetailsViewController

@synthesize dataDict = _dataDict;

CGFloat const kNavBarAndStatusBarHeight = 66.0f;

CGFloat const kTitleLabelWidth = 80.0f;
CGFloat const kTitleLabelHeight = 20.0f;

CGFloat const kTextLabelWidth = 210.0f;

CGFloat const kTitleSpacerVertical = 10.0f;
CGFloat const kTextSpacerVertical = 5.0f;
CGFloat const kTitleLabelX = 10.0f;
CGFloat const kTextLabelX = 100.0f;

#pragma mark - Memory Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithDictionary:(NSDictionary *)dict
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        [self setDataDict: dict];
    }
    
    return self;
}

- (void)dealloc
{
    [_dataDict release];
    
    [nameTitleLabel release];
    [nameTextLabel release];
    
    [typeTitleLabel release];
    [typeTextLabel release];
    
    [addressTitleLabel release];
    [address1TextLabel release];
    [address2TextLabel release];
    
    [reviewTitleLabel release];
    [reviewWebview release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Build view hierarchy
    CGFloat y = kTitleSpacerVertical;
    nameTitleLabel = [self titleLabel:@"Name" atPoint: CGPointMake(kTitleLabelX, y)];
    NSString* nameString = [[self dataDict] stringForKey:@"name"];
    nameString = [nameString stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    nameTextLabel = [self textLabel:nameString atPoint:CGPointMake(kTextLabelX, y)];
    
    y += nameTextLabel.frame.size.height + kTitleSpacerVertical;
    typeTitleLabel = [self titleLabel:@"Type" atPoint: CGPointMake(kTitleLabelX, y)];
    NSString* typeString = [[self dataDict] stringForKey:@"type"];
    typeString = [typeString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    typeTextLabel = [self textLabel:typeString atPoint:CGPointMake(kTextLabelX, y)];
    
    y += typeTextLabel.frame.size.height + kTitleSpacerVertical;
    addressTitleLabel = [self titleLabel:@"Address" atPoint: CGPointMake(kTitleLabelX, y)];
    NSDictionary* addressDict = [[self dataDict] dictionaryForKey:@"address"];
    NSString* address1 = [addressDict stringForKey: @"street"];
    address1 = [address1 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    address1TextLabel = [self textLabel:address1 atPoint:CGPointMake(kTextLabelX, y)];

    y += address1TextLabel.frame.size.height + kTextSpacerVertical;
    NSString* address2 = @"London, England";
    address2TextLabel = [self textLabel:address2 atPoint:CGPointMake(kTextLabelX, y)];

    y += address2TextLabel.frame.size.height + kTextSpacerVertical;
    reviewTitleLabel = [self titleLabel:@"Review" atPoint: CGPointMake(kTitleLabelX, y)];

    y += reviewTitleLabel.frame.size.height + kTitleSpacerVertical;
    reviewWebview = [[UIWebView alloc] init];
    reviewWebview.frame = CGRectMake(kTitleLabelX, y, 300, 480 - y - kTitleSpacerVertical - kNavBarAndStatusBarHeight);
    reviewWebview.backgroundColor = [UIColor clearColor];
    
    NSDictionary* reviewDict = [[self dataDict] dictionaryForKey:@"review"];
    NSString* summaryString = [reviewDict stringForKey:@"summary"];
    summaryString = [summaryString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [reviewWebview loadHTMLString:summaryString baseURL:nil];
    
    [[self view] addSubview: nameTitleLabel];
    [[self view] addSubview: nameTextLabel];
    
    [[self view] addSubview: typeTitleLabel];
    [[self view] addSubview: typeTextLabel];
    
    [[self view] addSubview: addressTitleLabel];
    [[self view] addSubview: address1TextLabel];
    [[self view] addSubview: address2TextLabel];
    
    [[self view] addSubview: reviewTitleLabel];
    [[self view] addSubview: reviewWebview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Styles

- (UIFont *)titleFont
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:16];
}

- (UIFont *)textFont
{
    return [UIFont fontWithName:@"Helvetica" size:16];
}

- (UIColor *)titleColor
{
    return [UIColor blackColor];
}

- (UIColor *)textColor
{
    return [UIColor blackColor];
}

#pragma mark - View Factory

- (UILabel *) titleLabel:(NSString *)title atPoint:(CGPoint)origin
{
    UILabel* label = [[UILabel alloc] initWithFrame: CGRectMake(origin.x, origin.y, kTitleLabelWidth, kTitleLabelHeight)];
    label.text = title;
    label.textColor = [self titleColor];
    label.font = [self titleFont];
    
    return label;
}

- (UILabel *) textLabel:(NSString *)text atPoint:(CGPoint)origin
{
    UILabel* label = [[UILabel alloc] initWithFrame: CGRectMake(origin.x, origin.y, kTextLabelWidth, kTitleLabelHeight)];
    label.text = text;
    label.textColor = [self textColor];
    label.font = [self textFont];

    CGSize textSize = [text sizeWithFont:label.font 
                       constrainedToSize:CGSizeMake(kTextLabelWidth, 100) 
                           lineBreakMode:UILineBreakModeWordWrap];
    if (textSize.height > kTitleLabelHeight) {
        label.numberOfLines = 2;
        label.frame = CGRectMake(origin.x, origin.y, textSize.width, textSize.height);
    }
    
    return label;
}


@end
