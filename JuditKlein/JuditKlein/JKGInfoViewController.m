//
//  JKGInfoViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 6/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGInfoViewController.h"

@interface JKGInfoViewController ()

@end

@implementation JKGInfoViewController

@synthesize backgroundImage;

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
    backgroundImage.image = [UIImage imageNamed:@"infoBackground"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
