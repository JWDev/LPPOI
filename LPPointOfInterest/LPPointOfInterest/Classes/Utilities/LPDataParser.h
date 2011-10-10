//
//  LPDataParser.h
//  LPPointOfInterest
//
//  Created by Joshua Worby on 11-10-09.
//  Copyright 2011 JWDev. All rights reserved.
//
//  DESIGN
//  Used to parse different types of data into a dictionary.  Currently it only handles JSON data
//  but this could be expanded into any type of data.
//
//  DUTIES
//  - parse JSON server data into a dictionary
//
//  FUTURE TODO
//  - parse XML server data into a dictionary


#import <Foundation/Foundation.h>


@interface LPDataParser : NSObject 
{
    
}

+ (NSDictionary *) dictionaryFromJSONString: (NSString *)jsonString;
+ (NSDictionary *) dictionaryFromXMLString: (NSString *)jsonString;

@end
