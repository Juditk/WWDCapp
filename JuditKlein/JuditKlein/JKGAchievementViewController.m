//
//  JKGAchievementViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 9/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGAchievementViewController.h"

@interface JKGAchievementViewController ()

@end

@implementation JKGAchievementViewController

@synthesize badgeImage, textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    //make the achievement badge animate in
    
    [UIView animateWithDuration:1.0
                          delay:0.2
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         badgeImage.alpha = 1;
                         badgeImage.transform = CGAffineTransformScale(badgeImage.transform, 1.1, 1.1);
                     }
                     completion:^(BOOL finished) {
                         textView.hidden = NO;
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dimsissView:(id)sender
{
    NSLog(@"Achievement View Dismissed");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
