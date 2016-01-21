//
//  JKGCountryDetailViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGCountryDetailViewController.h"

@interface JKGCountryDetailViewController ()

@end

@implementation JKGCountryDetailViewController

@synthesize backgroundImage, projectDetail, textView;

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
    
    //UI and formatting
    
    backgroundImage.image = [UIImage imageNamed:@"bgcolour"];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = projectDetail.projectName;
    
    NSMutableString *contentString = [NSMutableString stringWithFormat:@"%@",projectDetail.projectBlurb];
    
    if ( ![projectDetail.moreInfoURL isEqualToString:@""]) {
        NSString *urlString = [NSString stringWithFormat:@"\n\nMore information: %@",projectDetail.moreInfoURL];
        [contentString appendString:urlString];
    }
    textView.scrollEnabled = NO;
    textView.text = contentString;
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
    textView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:(222/255.0) green:(177/255.0) blue:(73/255.0) alpha:1], NSUnderlineStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    textView.scrollEnabled = YES;

    
    //set up the content on the secondary display
    
    [[JKGSecondScreenViewController sharedManager]setImagePrefix:projectDetail.imagePrefix];
    [[JKGSecondScreenViewController sharedManager]showSecondScreenContent];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //reset the content on the secondary display
    
    [[JKGSecondScreenViewController sharedManager]turnOffSecondScreen];
    [[JKGSecondScreenViewController sharedManager]setImagePrefix:nil];
    [[JKGSecondScreenViewController sharedManager]setCurrentImageIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
