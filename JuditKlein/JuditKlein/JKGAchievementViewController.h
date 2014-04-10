//
//  JKGAchievementViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 9/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKGAchievementViewController : UIViewController
{
    UIImageView *badgeImage;
    UITextView *textView;
}

@property (nonatomic, strong) IBOutlet UIImageView *badgeImage;
@property (nonatomic, strong) IBOutlet UITextView *textView;


-(IBAction)dimsissView:(id)sender;

@end
