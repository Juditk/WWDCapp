//
//  JKGDatabase.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGDatabase.h"

@implementation JKGDatabase

+ (JKGDatabase *) sharedDatabase
{
    static JKGDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = [[self alloc] init];
    });
    return database;
}


@end
