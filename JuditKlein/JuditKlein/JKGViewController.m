//
//  JKGViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGViewController.h"

@interface JKGViewController ()

@end

@implementation JKGViewController

@synthesize backgroundImage, planeImage, goToAKL, goToBUD, goToMEL, goToSFO, goToTVU, goToTXL;

- (void)viewDidLoad
{
    [super viewDidLoad];

    backgroundImage.image = [UIImage imageNamed:@"homescreenbg"];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    planeImage.image = [UIImage imageNamed:@"plane"];
    [goToTXL setImage:[UIImage imageNamed:@"txl"] forState:UIControlStateNormal];
    [goToTVU setImage:[UIImage imageNamed:@"tvu"] forState:UIControlStateNormal];
    [goToSFO setImage:[UIImage imageNamed:@"sfo"] forState:UIControlStateNormal];
    [goToMEL setImage:[UIImage imageNamed:@"mel"] forState:UIControlStateNormal];
    [goToBUD setImage:[UIImage imageNamed:@"bud"] forState:UIControlStateNormal];
    [goToAKL setImage:[UIImage imageNamed:@"akl"] forState:UIControlStateNormal];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)destinationBUD:(id)sender
{
    NSLog(@"Let's go to Hungary!");
    [self performSegueWithIdentifier:@"goto" sender:sender];
}

- (IBAction)destinationTXL:(id)sender
{
    NSLog(@"Let's go to Germany!");
}

- (IBAction)destinationAKL:(id)sender
{
    NSLog(@"Let's go to New Zealand!");
    
}

- (IBAction)destinationMEL:(id)sender
{
    NSLog(@"Let's go to Australia!");
    
}

- (IBAction)destinationSFO:(id)sender
{
    NSLog(@"Let's go to USA!");
    
}

- (IBAction)destinationTVU:(id)sender
{
    NSLog(@"Let's go to Fiji!");
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    countryViewController = segue.destinationViewController;
    
}

@end
