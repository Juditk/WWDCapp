//
//  JKGDatabase.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGDatabase.h"

@implementation JKGDatabase

@synthesize countriesList, countriesVisited, hasPlayedSafetyVideo;

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
    
    if (!countryShortName)
        return nil;
    
    NSDictionary *countryDict = nil;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:countryShortName ofType:@"plist"];
    
    countryDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (countryDict) {
        //NSLog(@"I have the following information for this country: %@",countryDict);
    }
    
    return countryDict;
    
}



@end
