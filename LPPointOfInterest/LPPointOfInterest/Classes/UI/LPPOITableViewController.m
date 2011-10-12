//
//  LPPOITableViewController.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 JWDev. All rights reserved.
//

#import "LPPOITableViewController.h"

#import "LPDataParser.h"
#import "LPPOIDetailsViewController.h"

#import "NSDictionary+Additions.h"

#pragma mark -

@interface LPPOITableViewController ()
- (void) buildData;
- (void) buildPoiListDictionary;
- (void) buildSections;
@end

#pragma mark -

@implementation LPPOITableViewController

@synthesize poiTableView = _poiTableView;

@synthesize poiListDictionary = _poiListDictionary;
@synthesize sections = _sections;

@synthesize sortedSectionTitles = _sortedSectionTitles;
@synthesize sortedSections = _sortedSections;

// String constants
//NSString* const kDataLoaded = @"dataLoaded";

#pragma mark - Memory Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Init data
        _sections = [[NSMutableDictionary alloc] init];
        
        // Init tableview
        _poiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
        [[self poiTableView] setDelegate: self];
        [[self poiTableView] setDataSource: self];

        // TODO: Add filter button to the navigation bar
        
        // Create view hierarchy
        [[self view] addSubview: [self poiTableView]];
    }
    return self;
}

- (void)dealloc
{
    [_poiTableView release];

    [_poiListDictionary release];    
    [_sections release];
    
    [_sortedSectionTitles release];
    [_sortedSections release];
    
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
    
//    [[self navigationController] setNavigationBarHidden: NO];
    [self buildData];
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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[self navigationItem] setTitle: @"Points of Interest"];
}

//- (void) viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}

#pragma mark - Build Data

- (void) buildData
{
    // TODO: Fade in spinner and black overlay
    
    // Load json data and turn it into a dictionary, then sections array
    [self buildPoiListDictionary];
    [self buildSections];
    
    // TODO: Fade out spinner and black overlay
}

/*
 * Takes the json file and turns it into a dictionary.
 */
- (void) buildPoiListDictionary
{
    // Loads the JSON file
    NSString* filepath = [[NSBundle mainBundle] pathForResource:@"pois" ofType:@"json"];
    NSAssert(filepath, @"ERROR: Filepath is incorrect.");
    NSString* jsonString = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    
    // Converts json string to dictionary
    [_poiListDictionary release];
    _poiListDictionary = nil;
    
    [self setPoiListDictionary: [LPDataParser dictionaryFromJSONString:jsonString]]; 
    
//#if DEBUG
//    NSLog(@"poiListDictionary = %@", [self poiListDictionary]);
//#endif
}

- (void) buildSections
{
    // Loop through all pois building section titles
    for (NSDictionary* poiDict in [self poiListDictionary]) {
        NSDictionary* dict = [poiDict dictionaryForKey: @"poi"];
        NSString* key = [[[dict stringForKey: @"name"] substringToIndex:1] uppercaseString];

        // Check if key already exists
        id object = [[self sections] objectForKey:key];
        if (object == nil) {
            [[self sections] setValue: [[NSMutableArray alloc] init] forKey:key];
        }
    }
    
//#if DEBUG
//    NSLog(@"sections = %@", [self sections]);
//#endif
    
    // Loop through pois again and sort them into their respective keys
    for (NSDictionary* poiDict in [self poiListDictionary]) {
        NSDictionary* dict = [poiDict dictionaryForKey: @"poi"];
        NSString* key = [[[dict stringForKey: @"name"] substringToIndex:1] uppercaseString];
        
        [[[self sections] objectForKey:key] addObject:dict];
    }
    
    // Sort section objects alphabetically
    for (NSString* key in [[self sections] allKeys]) {
        NSMutableArray* array = [[self sections] objectForKey: key];
        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending:YES];
        [array sortUsingDescriptors: [NSArray arrayWithObject:sortDescriptor]];
    }

//#if DEBUG
//    NSLog(@"sections = %@", [self sections]);
//#endif
    
    // Create sorted section titles
    [_sortedSectionTitles release];
    _sortedSectionTitles = nil;
        
    NSArray* array = [[self sections] allKeys];
    NSArray* sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self setSortedSectionTitles: [NSArray arrayWithArray:sortedArray]];

//#if DEBUG
//    NSLog(@"sortedSectionTitles = %@", [self sortedSectionTitles]);
//#endif
    
    // Create sorted sections array
    [_sortedSections release];
    _sortedSections = nil;
    
    [self setSortedSections: [NSMutableArray array]];
    for (NSString* key in [self sortedSectionTitles]) {
        NSMutableArray* array = [[self sections] objectForKey:key];
        [[self sortedSections] addObject: array];
    }
    
//#if DEBUG
//    NSLog(@"sortedSections = %@", [self sortedSections]);
//#endif
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self sortedSectionTitles] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self sortedSectionTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self sortedSectionTitles] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self sortedSections] objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray* section = [[self sortedSections] objectAtIndex:indexPath.section];
    NSDictionary* poiDict = [section objectAtIndex:indexPath.row];

    [cell.textLabel setText: [[poiDict stringForKey: @"name"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [cell.detailTextLabel setText: [poiDict stringForKey: @"type"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 30.0;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* section = [[self sortedSections] objectAtIndex:indexPath.section];
    NSDictionary* poiDict = [section objectAtIndex:indexPath.row];
    
    LPPOIDetailsViewController* detailsVC = [[LPPOIDetailsViewController alloc] initWithDictionary: poiDict];
    [[self navigationController] pushViewController:detailsVC animated:YES];
    [detailsVC release];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
