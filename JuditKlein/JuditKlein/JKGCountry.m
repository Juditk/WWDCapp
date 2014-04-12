//
//  JKGCountry.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGCountry.h"

@implementation JKGCountry

@synthesize countryName, countryProjects;

- (instancetype)initWithCountryDictionary: (NSDictionary*)countryDictionary
{
    self = [super init];
    if (self) {
        
        //initialise the country object and create a countryProjectDetail object with the contents of dictionary
        
        countryName = [countryDictionary objectForKey:@"Name"];
        
        countryProjects = [[NSMutableArray alloc]init];
        
        for (NSDictionary *projDict in [countryDictionary objectForKey:@"Projects"]) {
            JKGCountryProjectDetail *proj = [[JKGCountryProjectDetail alloc]initWithDictionary:projDict];
            [countryProjects addObject:proj];
        }
    }
    return self;
}

@end
