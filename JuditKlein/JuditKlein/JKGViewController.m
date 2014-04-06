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

@synthesize backgroundImage, planeImage, goToAKL, goToBUD, goToMEL, goToSFO, goToTVU, goToTXL, countryCode;

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

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)destinationBUD:(id)sender
{
    NSLog(@"Let's go to Hungary!");
    countryCode = @"BUD";
    [self performSegueWithIdentifier:@"goto" sender:sender];
}

- (IBAction)destinationTXL:(id)sender
{
    NSLog(@"Let's go to Germany!");
    countryCode = @"TXL";
    [self performSegueWithIdentifier:@"goto" sender:sender];

}

- (IBAction)destinationAKL:(id)sender
{
    NSLog(@"Let's go to New Zealand!");
    countryCode = @"AKL";
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationMEL:(id)sender
{
    NSLog(@"Let's go to Australia!");
    countryCode = @"MEL";
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationSFO:(id)sender
{
    NSLog(@"Let's go to USA!");
    countryCode = @"SFO";
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationTVU:(id)sender
{
    NSLog(@"Let's go to Fiji!");
    countryCode = @"TVU";
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JKGCountryViewController *countryViewController = segue.destinationViewController;
    
    NSDictionary *countryInformation = [[JKGDatabase sharedDatabase]loadCountryWithShortName:countryCode];
    NSLog(@"I have the following information for this country: %@",countryInformation);
    
    if ( countryInformation ) {
        JKGCountry *country = [[JKGCountry alloc]initWithCountryDictionary:countryInformation];
        NSLog(@"%@",country);
        [countryViewController setCountry:country];
        [countryViewController setCountryName:country.countryName];
    }
    
    
}



@end
