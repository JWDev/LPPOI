//
//  LPPOITableViewController.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-10.
//  Copyright 2011 JWDev. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LPPOITableViewController : UIViewController 
<
    UITableViewDataSource,
    UITableViewDelegate
>
{
    UITableView* _poiTableView;
    
@private
    NSDictionary* _poiListDictionary;
    
    NSMutableDictionary* _sections;
    
    NSMutableArray* _sortedSectionTitles;
    NSMutableArray* _sortedSections;
}

@property (nonatomic, retain) UITableView* poiTableView;

@property (nonatomic, retain) NSDictionary* poiListDictionary;
@property (nonatomic, retain) NSMutableDictionary* sections;

@property (nonatomic, retain) NSMutableArray* sortedSectionTitles;
@property (nonatomic, retain) NSMutableArray* sortedSections;

@end
