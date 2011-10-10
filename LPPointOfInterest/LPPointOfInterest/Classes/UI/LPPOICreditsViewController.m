//
//  LPPOICreditsViewController.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "LPPOICreditsViewController.h"
#import "UIColor+Additions.h"

@implementation LPPOICreditsViewController

@synthesize nameLabel = _nameLabel;
@synthesize copyrightDateLabel = _copyrightDateLabel;

#pragma mark - Memory Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self view] setBackgroundColor: [UIColor colorWithHexString:@"0x113450" alpha:1.0]];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 240, 40)];
        [[self nameLabel] setBackgroundColor: [UIColor clearColor]];
        [[self nameLabel] setText: @"Joshua Worby"];
        [[self nameLabel] setTextColor: [UIColor whiteColor]];
        [[self nameLabel] setFont: [UIFont fontWithName:@"Helvetica-Bold" size:28]];
        [[self nameLabel] setTextAlignment: UITextAlignmentCenter];
        
        _copyrightDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 140, 240, 40)];
        [[self copyrightDateLabel] setBackgroundColor: [UIColor clearColor]];
        [[self copyrightDateLabel] setText: @"Copyright 2011."];
        [[self copyrightDateLabel] setTextColor: [UIColor whiteColor]];
        [[self copyrightDateLabel] setFont: [UIFont fontWithName:@"Helvetica" size:14]];
        [[self copyrightDateLabel] setTextAlignment: UITextAlignmentCenter];
        
        // Create view hierarchy
        [[self view] addSubview: [self nameLabel]];
        [[self view] addSubview: [self copyrightDateLabel]];
    }
    return self;
}

- (void)dealloc
{
    [_nameLabel release];
    [_copyrightDateLabel release];
    
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
    [[self navigationItem] setTitle: @"Credits"];
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

@end
