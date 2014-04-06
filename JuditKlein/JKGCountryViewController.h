//
//  JKGCountryViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKGCountry.h"
#import "JKGCountryDetailViewController.h"
#import "JKGCountryProjectDetail.h"

@interface JKGCountryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *backgroundImage;
    JKGCountry *country;
    NSString *countryName;
    UITableView *tableView;
    
}
@property (nonatomic, strong) JKGCountry *country;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
