//
//  JKGCountryDetailViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKGCountryProjectDetail.h"

@interface JKGCountryDetailViewController : UIViewController
{
    UIImageView *backgroundImage;
    JKGCountryProjectDetail *projectDetail;
    UITextView *textView;
    
}

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, strong) JKGCountryProjectDetail *projectDetail;
@property (nonatomic, strong) IBOutlet UITextView *textView;


@end
