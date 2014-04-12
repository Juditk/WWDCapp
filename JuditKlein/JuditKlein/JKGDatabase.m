//
//  JKGDatabase.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGDatabase.h"

@implementation JKGDatabase

@synthesize countriesList, countriesVisited, hasPlayedSafetyVideo, hasUnlockedAchievement;

+ (JKGDatabase *) sharedDatabase
{
    static JKGDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = [[self alloc] init];
    });
    return database;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //set up dictionary which can be checked later to see if it has been visited.
        
        countriesVisited = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                            @"AKL",@NO,
                            @"TVU", @NO,
                            @"SFO", @NO,
                            @"TXL", @NO,
                            @"BUD", @NO,
                            @"MEL", @NO,
                            nil];
    }
    return self;
}



- (NSDictionary*)loadCountryWithShortName:(NSString*)countryShortName{
    
    //returns the information from plist about a country.
    
    if (!countryShortName)
        return nil;
    
    NSDictionary *countryDict = nil;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:countryShortName ofType:@"plist"];
    
    countryDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (countryDict) {
        NSLog(@"I have information for this country.");
    } else {
        NSLog(@"I don't have any information for this country.");
    }
    
    return countryDict;
    
}



@end
