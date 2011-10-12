//
//  LPPOIMapViewController.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 Team Pixel. All rights reserved.
//

#import "LPPOIMapViewController.h"

#import "LPPOIMapAnnotation.h"
#import "NSDictionary+Additions.h"

@implementation LPPOIMapViewController

@synthesize dataDict = _dataDict;
@synthesize mapView = _mapView;

#pragma mark - Memory Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self navigationItem] setTitle:@"Point of Interest"];
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
    [_mapView release];
    
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

    // Init mapview to be centered on London, England
    _mapView = [[MKMapView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)];
    [[self mapView] setDelegate: self];
    [[self mapView] setMapType: MKMapTypeStandard];

    // Centre map on POI position
    CLLocationCoordinate2D coord;
    coord.latitude = [[[self dataDict] numberFromFloatForKey:@"latitude"] doubleValue];
    coord.longitude = [[[self dataDict] numberFromFloatForKey:@"longitude"] doubleValue];

    // Set view span
    MKCoordinateRegion mapRegion;
    mapRegion.center = coord;
    mapRegion.span.latitudeDelta = 0.1;
    mapRegion.span.longitudeDelta = 0.1;
    [[self mapView] setRegion: mapRegion];
    
    // Add pin
    LPPOIMapAnnotation* annotation = [[LPPOIMapAnnotation alloc] initWithCoordinate:coord];
    [[self mapView] addAnnotation: annotation];
    [annotation release];
    
    [[self view] addSubview: [self mapView]];
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

#pragma mark -
#pragma mark MKMapView delegate methods 

- (void) mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error 
{
    NSLog(@"*** ERROR: Problem loading map.");
    
    // TODO: Popup alert message
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
    MKPinAnnotationView* view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"];
    [view setPinColor: MKPinAnnotationColorRed];
    [view setAnimatesDrop: YES];
    
    return view;
}

@end
