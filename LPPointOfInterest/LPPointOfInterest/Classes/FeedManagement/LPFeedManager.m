//
//  LPFeedManager.m
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//

#import "LPFeedManager.h"

#import "LPDataParser.h"

#pragma mark -
@interface LPFeedManager ()

@end


#pragma mark -

@implementation LPFeedManager

// Singleton
static LPFeedManager* sharedInstance = nil;

#pragma mark - Singleton Memory Management

+ (LPFeedManager*) sharedInstance 
{
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

+ (id) allocWithZone:(NSZone*)zone 
{
    return [[self sharedInstance] retain];
}

- (id) copyWithZone:(NSZone *)zone 
{
    return self;
}

- (id) retain 
{
    return self;
}

- (NSUInteger) retainCount 
{
    return NSUIntegerMax;
}

- (void) release 
{
}

- (id) autorelease 
{
    return self;
}

- (id) init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) dealloc
{
    
    [super dealloc];
}

#pragma mark - Public Methods

/*
 * Takes the given json data file and writes it to the core data database.
 */
- (void) downloadPOIData
{
    // Loads the JSON file
    NSString* filepath = [[NSBundle mainBundle] pathForResource:@"pois" ofType:@"json"];
    NSAssert(filepath, @"ERROR: Filepath is incorrect.");
    
    NSString* jsonString = [NSString stringWithContentsOfFile:filepath encoding:NSASCIIStringEncoding error:nil];
    
    // Converts json string to dictionary
    NSDictionary* poiListDictionary = [LPDataParser dictionaryFromJSONString:jsonString];
    NSLog(@"poiListDictionary = %@", poiListDictionary);
    
    // Notify front end that data loaded
    // TODO: Check if this step is really needed since the NSFetchedResultsControllerDelegate methods should take care of this.
}



@end
