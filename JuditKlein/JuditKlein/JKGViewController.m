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

@synthesize backgroundImage, planeImage, goToAKL, goToBUD, goToMEL, goToSFO, goToTVU, goToTXL, countryCode, locationManager, replayButton, infoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    backgroundImage.image = [UIImage imageNamed:@"homescreenbg"];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    planeImage.image = [UIImage imageNamed:@"plane"];
    queue = [[NSMutableArray alloc]init];

    [self setImageStates];
    
    [self performSelector:@selector(playSafetyBriefing) withObject:nil afterDelay:0.1];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:(222/255.0) green:(177/255.0) blue:(73/255.0) alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(239/255.0) green:(238/255.0) blue:(222/255.0) alpha:1]];
    
    if ( [CLLocationManager headingAvailable]) {
        [self setUpLocation];
    }
    
    stampCount = 0;
    self.view.multipleTouchEnabled = NO;
    
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
    
    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 50 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
}
//145 180 220 319 0

- (IBAction)destinationTXL:(id)sender
{
    NSLog(@"Let's go to Germany!");
    countryCode = @"TXL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];

    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 320 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
}

- (IBAction)destinationAKL:(id)sender
{
    NSLog(@"Let's go to New Zealand!");
    countryCode = @"AKL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];

    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 220 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
}

- (IBAction)destinationMEL:(id)sender
{
    NSLog(@"Let's go to Australia!");
    countryCode = @"MEL";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];

    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 180 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
    
    
}

- (IBAction)destinationSFO:(id)sender
{
    NSLog(@"Let's go to USA!");
    countryCode = @"SFO";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];

    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 0 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
}

- (IBAction)destinationTVU:(id)sender
{
    NSLog(@"Let's go to Fiji!");
    countryCode = @"TVU";
    [[[JKGDatabase sharedDatabase]countriesVisited]setObject:@YES forKey:countryCode];

    [locationManager stopUpdatingHeading];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         planeImage.transform = CGAffineTransformMakeRotation((-1 * 145 * M_PI) /180);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"goto" sender:sender];
                     }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"goto"] ) {
        
        JKGCountryViewController *countryViewController = segue.destinationViewController;
        
        NSDictionary *countryInformation = [[JKGDatabase sharedDatabase]loadCountryWithShortName:countryCode];
        
        if ( countryInformation ) {
            JKGCountry *country = [[JKGCountry alloc]initWithCountryDictionary:countryInformation];
            [countryViewController setCountry:country];
            [countryViewController setCountryName:country.countryName];
        }
    }
}

- (IBAction)infoButtonTapped:(id)sender
{
    NSLog(@"Info Button Tapped");
    [self performSegueWithIdentifier:@"infoScreen" sender:self];

    
}

- (UIImage*)getButtonStateForCountry: (NSString*)countryCodeToCheck
{
    if ( ![[[JKGDatabase sharedDatabase]countriesVisited]objectForKey:countryCodeToCheck] ) {
        return [UIImage imageNamed:countryCodeToCheck];

    } else {
        stampCount++;
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@stamp",countryCodeToCheck]];
    }
    

}

- (void)setImageStates
{
    
    [goToTVU.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToTVU setImage:[self getButtonStateForCountry:@"TVU"] forState:UIControlStateNormal];
    goToTVU.exclusiveTouch = YES;
    
    [goToBUD.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToBUD setImage:[self getButtonStateForCountry:@"BUD"] forState:UIControlStateNormal];
    goToBUD.exclusiveTouch = YES;
    
    [goToSFO.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToSFO setImage:[self getButtonStateForCountry:@"SFO"] forState:UIControlStateNormal];
    goToSFO.exclusiveTouch = YES;   
    
    [goToTXL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToTXL setImage:[self getButtonStateForCountry:@"TXL"] forState:UIControlStateNormal];
    goToTXL.exclusiveTouch = YES;
    
    [goToAKL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToAKL setImage:[self getButtonStateForCountry:@"AKL"] forState:UIControlStateNormal];
    goToAKL.exclusiveTouch = YES;
    
    [goToMEL.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [goToMEL setImage:[self getButtonStateForCountry:@"MEL"] forState:UIControlStateNormal];
    goToMEL.exclusiveTouch = YES;
    
    infoButton.exclusiveTouch = YES;
    replayButton.exclusiveTouch = YES;
    
    if ( stampCount == 6) {
        
        if ( ![[JKGDatabase sharedDatabase]hasUnlockedAchievement]) {
            
            [self performSegueWithIdentifier:@"achievement" sender:self];
            [[JKGDatabase sharedDatabase]setHasUnlockedAchievement:YES];
        }
    }
}

#pragma mark location manager

- (void)setUpLocation
{
    locationManager=[[CLLocationManager alloc] init];
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.headingFilter = 1;
	locationManager.delegate=self;
	[locationManager startUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)heading
{
    int newHeading;
    NSUInteger queuecount;
    
    newHeading = heading.trueHeading;
    [queue addObject:[NSNumber numberWithInt:newHeading]];
    
    if([queue count] > 10) [queue removeObjectAtIndex:0];
    queuecount = [queue count];
    
    NSEnumerator *e = [queue objectEnumerator];
    NSNumber *sum;
    int oldd = 0 , newd, average =0;
    BOOL firstLoop = YES;
    while ((sum = [e nextObject]))
    {
        newd = [sum intValue];
        if(firstLoop) {oldd = newd;firstLoop=NO;}
        
        if((newd +180) < oldd)
        {
            newd +=360; oldd = newd;
            average = average + newd;
            continue;
        }
        if((newd - 180) > oldd)
        {
            newd -=360;oldd = newd;
            average = average + newd;
            continue;
        }
        
        average = average + newd;
        oldd = newd;
        
    }
    average = (average / queuecount) % 360;
    
    [planeImage setTransform:CGAffineTransformMakeRotation((-1 * average * M_PI) /180)];

}

- (IBAction)replayBriefing:(id)sender
{
    NSLog(@"Reply safety briefing button tapped");
    [self performSegueWithIdentifier:@"safetyVideo" sender:self];
}

- (void)playSafetyBriefing
{
    if ( ![[JKGDatabase sharedDatabase]hasPlayedSafetyVideo]) {
        [self performSegueWithIdentifier:@"safetyVideo" sender:self];
        [[JKGDatabase sharedDatabase]setHasPlayedSafetyVideo:YES];
    }
}



@end
