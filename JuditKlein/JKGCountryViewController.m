//
//  JKGCountryViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGCountryViewController.h"

@interface JKGCountryViewController ()

@end

@implementation JKGCountryViewController

@synthesize backgroundImage,country, tableView, countryName, passbookLocalButton;

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
    backgroundImage.image = [UIImage imageNamed:@"infoBackground"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = countryName;
    
    //set the localised Passbook icon for the button
    
    if ( [countryName isEqualToString:@"Germany"] | [countryName isEqualToString:@"Hungary"] ) {
        [passbookLocalButton setImage:[UIImage imageNamed:countryName] forState:UIControlStateNormal];
    } else {
        [passbookLocalButton setImage:[UIImage imageNamed:@"passbooken"] forState:UIControlStateNormal];
    }
    passbookLocalButton.exclusiveTouch = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Calling %lu rows for this country",(unsigned long)[[country countryProjects]count]);
    
    // Return the number of rows in the section.
    return [[country countryProjects]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    static NSString *cellIdentifier = @"projectCell";
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    JKGCountryProjectDetail *projDetail = [[country countryProjects]objectAtIndex:indexPath.row];
    cell.textLabel.text = projDetail.projectName;

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessoryicon"]];
    cell.accessoryView = imageView;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    JKGCountryDetailViewController *countryDetailViewController = segue.destinationViewController;
    NSIndexPath *myIndexPath = [self.tableView
                                indexPathForSelectedRow];
    JKGCountryProjectDetail *projDetail = [[country countryProjects]objectAtIndex:myIndexPath.row];
    [countryDetailViewController setProjectDetail:projDetail];
    
}

#pragma mark Passbook

- (IBAction)showPass:(id)sender
{
    NSLog(@"Issue boarding pass for %@",countryName);
    NSString *passFileName = [[NSBundle mainBundle] pathForResource:countryName ofType:@"pkpass"];
    NSData *passData = [NSData dataWithContentsOfFile:passFileName];
    PKPass *pass = [[PKPass alloc]initWithData:passData error:nil];
    
    PKAddPassesViewController *addPassVC = [[PKAddPassesViewController alloc]initWithPass:pass];
    [self presentViewController:addPassVC animated:YES completion:nil];
}

-(void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
