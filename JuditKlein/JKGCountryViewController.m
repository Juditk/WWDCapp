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

@synthesize backgroundImage,country, tableView, countryName;

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
    self.navigationItem.title = countryName;

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
    NSLog(@"Calling Num Rows %lu",(unsigned long)[[country countryProjects]count]);
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
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
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

@end
