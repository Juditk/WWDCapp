//
//  JKGSecondScreenViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 6/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKGSecondScreenViewController : UIViewController
{
    UIWindow *secondWindow;
    UIImageView *displayedImage;
    NSString *imagePrefix;
    NSArray *foundImagesWithPrefix;
    int currentImageIndex;
    NSTimer *timer;
}

@property (nonatomic,strong) UIWindow *secondWindow;
@property (nonatomic, strong) IBOutlet UIImageView *displayedImage;
@property (nonatomic, strong) NSString *imagePrefix;
@property (nonatomic, strong) NSArray *foundImagesWithPrefix;
@property (nonatomic) int currentImageIndex;

- (void) showSecondScreenContent;
+ (JKGSecondScreenViewController *) sharedManager;
- (void)turnOffSecondScreen;


@end
