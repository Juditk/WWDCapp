//
//  JKGCountryProjectDetail.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGCountryProjectDetail.h"

@implementation JKGCountryProjectDetail

@synthesize imagePrefix, moreInfoURL, projectBlurb, supportingProjectImages, projectName;

- (instancetype)initWithDictionary: (NSDictionary*) projectDictionary
{
    self = [super init];
    if (self) {
        
        //initialise the object with the details needed by the viewController
        
        projectName  = [projectDictionary objectForKey:@"ProjectName"];
        projectBlurb = [projectDictionary objectForKey:@"ProjectBlurb"];
        moreInfoURL  = [projectDictionary objectForKey:@"ProjectURL"];
        imagePrefix  = [projectDictionary objectForKey:@"ProjectImagePrefix"];
        
    }
    return self;
}

-(void)loadImagesForProject
{
    //enumerate directory
    //get all the filepaths for images with the prefix
    //set them in the array
    
}

@end
