//
//  LPFeedManager.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//
//  
//  DESIGN
//  Singleton design to allow flexibility and scalability for future use.  
//  Allows a single interface for incoming data management.  Currently, it uses a data file (JSON) as the input
//  feed.  However, this design is extensible to allow for incoming network data by centralizing all feed URLs
//  and their handling in one place.
//
//  DUTIES
//  - handle input data (JSON file)
//  - parse it into correct format (JSON to NSDictionary)
//  - save data to database (NSDictionary to Core Data)
//  - signal to front end to update views (NSNotification and through NSFetchResultsControllerDelegate)
//
//  FUTURE TODO
//  - add network manager
//  - add feed url building
//  - add feed data handling


#import <Foundation/Foundation.h>


@interface LPFeedManager : NSObject {
    
}

#pragma mark - Class Methods

+ (id) sharedInstance;

#pragma mark - Public Methods

- (void) downloadPOIData;

@end
