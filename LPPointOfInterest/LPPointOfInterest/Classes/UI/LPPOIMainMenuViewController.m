//
//  LPPOIMainMenuViewController.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "LPPOIMainMenuViewController.h"

#import "LPPOICreditsViewController.h"
#import "LPPOITableViewController.h"
#import "LPStyleManager.h"

#import <QuartzCore/QuartzCore.h>

#pragma mark -

@interface LPPOIMainMenuViewController ()
- (void) poiButtonPressed: (UIButton *)button;
- (void) creditsButtonPressed: (UIButton *)button;

- (UIButton *) buttonWithText:(NSString *)text atPoint:(CGPoint)origin action:(SEL)action;

- (UIImage *) nextImage;
@end

#pragma mark -

@implementation LPPOIMainMenuViewController

@synthesize timer = _timer;
@synthesize imageView = _imageView;
@synthesize poiButton = _poiButton;
@synthesize creditsButton = _creditsButton;

CGFloat const kButtonWidth = 300.0f;
CGFloat const kButtonHeight = 40.0f;

CGFloat const kTimerDuration = 3.0f;

#pragma mark - Memory Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Customize view
        [[self view] setBackgroundColor: [LPStyleManager colorBackground]];
        
        // Add top image area
        UIImage* image = [self nextImage];
        _imageView = [[UIImageView alloc] initWithImage: image];
        [[self imageView] setFrame: CGRectMake(0, 0, 320, 240)];
        [image release];
                
        // Add buttons
        _poiButton = [self buttonWithText:NSLocalizedString(@"Points of Interest", @"Points of Interest") 
                                  atPoint:CGPointMake(10, 270)
                                   action:@selector(poiButtonPressed:)];

        _creditsButton = [self buttonWithText:NSLocalizedString(@"Credits", @"Credits")
                                      atPoint:CGPointMake(10, 350)
                                       action:@selector(creditsButtonPressed:)];

        // Create view hierarchy
        [[self view] addSubview: [self imageView]];
        [[self view] addSubview: [self poiButton]];
        [[self view] addSubview: [self creditsButton]];
    }
    return self;
}

- (void)dealloc
{
    [_imageView release];
    
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Setup navigation bar
    [[self navigationItem] setTitle: @"London"];
    [[[self navigationController] navigationBar] setTintColor:[LPStyleManager colorBackground]];
    
    // Setup the timer
    if ([self timer] == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:kTimerDuration target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    }
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Stop the timer
    if ([self timer]) {
        [[self timer] invalidate];
        _timer = nil;
    }
}

#pragma mark - View Factory

- (UIButton *) buttonWithText:(NSString *)text atPoint:(CGPoint)origin action:(SEL)action
{
    UIButton* button = [[UIButton buttonWithType: UIButtonTypeRoundedRect] retain];
    [button setFrame: CGRectMake(origin.x, origin.y, kButtonWidth, kButtonHeight)];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text  forState:UIControlStateSelected];
    [button setTitleColor:[LPStyleManager colorButtonNormalTitle] forState:UIControlStateNormal];
    [button setTitleColor:[LPStyleManager colorButtonSelectedTitle] forState:UIControlStateSelected];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [[button titleLabel] setFont: [LPStyleManager fontButtonTitle]];
    
    return button;
}

#pragma mark - Button Actions

- (void) poiButtonPressed: (UIButton *)button
{
//    NSLog(@"poiButtonPressed");

    LPPOITableViewController* poiTableViewController = [[LPPOITableViewController alloc] initWithNibName:nil bundle:nil];
    [[self navigationController] pushViewController:poiTableViewController animated:YES];
    [poiTableViewController release];
}

- (void) creditsButtonPressed: (UIButton *)button
{
//    NSLog(@"creditsButtonPressed");
    
    LPPOICreditsViewController* poiCreditVC = [[LPPOICreditsViewController alloc] initWithNibName:nil bundle:nil];
    [[self navigationController] pushViewController:poiCreditVC animated:YES];
    [poiCreditVC release];
}

#pragma mark - Timer Actions

- (void) timerFired: (id)sender
{
//    NSLog(@"timerFired");
    
    // Fade out current image
    [UIView animateWithDuration:0.5f 
                     animations: ^ {
                         [[self imageView] setAlpha:0.0f];  
                     } 
     
                     completion: ^ (BOOL finished) {
                         [[self imageView] setAlpha:0.0f];
                         
                         // Fade in next image
                         UIImage* image = [self nextImage];
                         [[self imageView] setImage: image];
                         [image release];
                         
                         [UIView animateWithDuration:0.5f 
                                          animations: ^ {
                                              [[self imageView] setAlpha:1.0f];
                                          }
                          
                                          completion: ^ (BOOL finished) {
                                              [[self imageView] setAlpha:1.0f];
                                          }
                          ];
                     }
    ];
}

- (UIImage *) nextImage 
{
    currentImageIndex++;
    if (currentImageIndex > 4) {
        currentImageIndex = 1;
    }

    NSString* imageFileName = [NSString stringWithFormat:@"london%d.png", currentImageIndex];
    UIImage* image = [UIImage imageNamed:imageFileName];
    
    return [image retain];
}


@end
