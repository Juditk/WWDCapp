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
    backgroundImage.image = [UIImage imageNamed:@"bgcolour"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    NSMutableString *contentString = [NSMutableString stringWithFormat:@"%@",projectDetail.projectBlurb];
    
    if ( ![projectDetail.moreInfoURL isEqualToString:@""]) {
        NSString *urlString = [NSString stringWithFormat:@"\n\nMore information: %@",projectDetail.moreInfoURL];
        [contentString appendString:urlString];
    }
    
    textView.text = contentString;

    [[JKGSecondScreenViewController sharedManager]setImagePrefix:projectDetail.imagePrefix];
    [[JKGSecondScreenViewController sharedManager]showSecondScreenContent];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [[JKGSecondScreenViewController sharedManager]turnOffSecondScreen];
    [[JKGSecondScreenViewController sharedManager]setImagePrefix:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
