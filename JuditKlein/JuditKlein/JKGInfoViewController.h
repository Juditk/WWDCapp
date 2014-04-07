//
//  JKGInfoViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 6/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKGInfoViewController : UIViewController
{
    UIImageView *backgroundImage;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;

- (IBAction)doneButton:(id)sender;
- (IBAction)rewatchBriefing:(id)sender;

@end
