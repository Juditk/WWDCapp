//
//  JKGCountryProjectDetail.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKGCountryProjectDetail : NSObject
{
    NSString *projectBlurb;
    NSString *projectName;
    NSArray *supportingProjectImages;
    NSString *moreInfoURL;
    NSString *imagePrefix;
}

@property (nonatomic, strong) NSString *projectBlurb;
@property (nonatomic, strong) NSArray *supportingProjectImages;
@property (nonatomic, strong) NSString *moreInfoURL;
@property (nonatomic, strong) NSString *imagePrefix;
@property (nonatomic, strong) NSString *projectName;

- (instancetype)initWithDictionary: (NSDictionary*) projectDictionary;

@end
