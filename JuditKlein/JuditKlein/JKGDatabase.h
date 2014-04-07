//
//  JKGDatabase.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKGDatabase : NSObject
{
    NSDictionary *countriesList;
    NSMutableDictionary *countriesVisited;
    BOOL hasPlayedSafeyVideo;
}

@property (nonatomic, strong) NSDictionary *countriesList;
@property (nonatomic, strong) NSMutableDictionary *countriesVisited;
@property (nonatomic) BOOL hasPlayedSafetyVideo;

+ (JKGDatabase *) sharedDatabase;
- (NSDictionary*)loadCountryWithShortName:(NSString*)countryShortName;

@end
