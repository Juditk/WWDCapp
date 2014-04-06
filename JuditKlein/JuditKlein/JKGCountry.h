//
//  JKGCountry.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKGCountryProjectDetail.h"

@interface JKGCountry : NSObject
{
    NSString *countryName;
    NSMutableArray *countryProjects;
    
}

@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSMutableArray *countryProjects;

- (instancetype)initWithCountryDictionary: (NSDictionary*)countryDictionary;

@end
