//
//  JKGViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKGCountryViewController.h"

@interface JKGViewController : UIViewController
{
    UIImageView *backgroundImage;
    UIImageView *planeImage;
    UIButton *goToBUD;
    UIButton *goToTXL;
    UIButton *goToAKL;
    UIButton *goToMEL;
    UIButton *goToSFO;
    UIButton *goToTVU;
    JKGCountryViewController *countryViewController;
}

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, strong) IBOutlet UIImageView *planeImage;
@property (nonatomic, strong) IBOutlet UIButton *goToBUD;
@property (nonatomic, strong) IBOutlet UIButton *goToTXL;
@property (nonatomic, strong) IBOutlet UIButton *goToAKL;
@property (nonatomic, strong) IBOutlet UIButton *goToMEL;
@property (nonatomic, strong) IBOutlet UIButton *goToSFO;
@property (nonatomic, strong) IBOutlet UIButton *goToTVU;

- (IBAction)destinationBUD:(id)sender;
- (IBAction)destinationTXL:(id)sender;
- (IBAction)destinationAKL:(id)sender;
- (IBAction)destinationMEL:(id)sender;
- (IBAction)destinationSFO:(id)sender;
- (IBAction)destinationTVU:(id)sender;


@end
