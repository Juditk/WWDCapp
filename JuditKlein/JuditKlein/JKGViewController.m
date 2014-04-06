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
    
    [self setImageStates];


}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
    [self setImageStates];
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
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
    [self performSegueWithIdentifier:@"goto" sender:sender];
}

- (IBAction)destinationTXL:(id)sender
{
    NSLog(@"Let's go to Germany!");
    countryCode = @"TXL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
    [self performSegueWithIdentifier:@"goto" sender:sender];

}

- (IBAction)destinationAKL:(id)sender
{
    NSLog(@"Let's go to New Zealand!");
    countryCode = @"AKL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationMEL:(id)sender
{
    NSLog(@"Let's go to Australia!");
    countryCode = @"MEL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationSFO:(id)sender
{
    NSLog(@"Let's go to USA!");
    countryCode = @"SFO";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
    [self performSegueWithIdentifier:@"goto" sender:sender];
    
}

- (IBAction)destinationTVU:(id)sender
{
    NSLog(@"Let's go to Fiji!");
    countryCode = @"TVU";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];
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

- (IBAction)infoButtonTapped:(id)sender
{
    NSLog(@"Info Button Tapped");
}

- (UIImage*)getButtonStateForCountry: (NSString*)countryCodeToCheck
{
    if ( ![[[JKGDatabase sharedDatabase]countriesVisited]objectForKey:countryCodeToCheck] ) {
        return [UIImage imageNamed:countryCodeToCheck];
    } else {
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@stamp",countryCodeToCheck]];
    }
}

- (void)setImageStates
{
    [goToTVU.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToTVU setImage:[self getButtonStateForCountry:@"TVU"] forState:UIControlStateNormal];
    
    [goToBUD.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToBUD setImage:[self getButtonStateForCountry:@"BUD"] forState:UIControlStateNormal];
    
    [goToSFO.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToSFO setImage:[self getButtonStateForCountry:@"SFO"] forState:UIControlStateNormal];
    
    [goToTXL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToTXL setImage:[self getButtonStateForCountry:@"TXL"] forState:UIControlStateNormal];
    
    [goToAKL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToAKL setImage:[self getButtonStateForCountry:@"AKL"] forState:UIControlStateNormal];
    
    [goToMEL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToMEL setImage:[self getButtonStateForCountry:@"MEL"] forState:UIControlStateNormal];
}


@end
