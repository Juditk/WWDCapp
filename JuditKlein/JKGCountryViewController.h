//
//  JKGCountryViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKGCountryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *backgroundImage;
}

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;

@end