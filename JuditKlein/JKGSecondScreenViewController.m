//
//  JKGSecondScreenViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 6/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGSecondScreenViewController.h"

@interface JKGSecondScreenViewController ()

@end

@implementation JKGSecondScreenViewController

@synthesize secondWindow, displayedImage, foundImagesWithPrefix, imagePrefix, currentImageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


+ (JKGSecondScreenViewController *) sharedManager
{
    static JKGSecondScreenViewController *sharedSecondScreen = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSecondScreen = [[self alloc] init];
    });
    return sharedSecondScreen;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    displayedImage.image = [UIImage imageNamed:@"secondscreenbg"];
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self checkForExistingScreenAndInitializeIfPresent];
        [self setUpScreenConnectionNotificationHandlers];
    }
    return self;
}
- (void)checkForExistingScreenAndInitializeIfPresent
{
    if ([[UIScreen screens] count] > 1)
    {
        NSLog(@"More Than One Screen Found");
        
        // Get the screen object that represents the external display.
        UIScreen *secondScreen = [[UIScreen screens] objectAtIndex:1];
        
        // Get the screen's bounds so that you can create a window of the correct size.
        CGRect screenBounds = secondScreen.bounds;
        
        self.secondWindow = [[UIWindow alloc] initWithFrame:screenBounds];
        self.secondWindow.screen = secondScreen;
        
        // Set up initial content to display...
        // Show the window.
        self.secondWindow.hidden = NO;
        secondWindow.rootViewController = self;
        [secondWindow makeKeyAndVisible];
        
        [self showSecondScreenContent];
        
    }
    
    
}

//---------------------------------------------------------------
// Register for screen connection and disconnection notifications

- (void)setUpScreenConnectionNotificationHandlers
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(handleScreenDidConnectNotification:)
                   name:UIScreenDidConnectNotification object:nil];
    [center addObserver:self selector:@selector(handleScreenDidDisconnectNotification:)
                   name:UIScreenDidDisconnectNotification object:nil];
}

- (void)handleScreenDidConnectNotification:(NSNotification*)aNotification
{
    UIScreen *newScreen = [aNotification object];
    CGRect screenBounds = newScreen.bounds;
    
    NSLog(@"Found screen, connect to it.");
    
    if (!self.secondWindow)
    {
        self.secondWindow = [[UIWindow alloc] initWithFrame:screenBounds];
        self.secondWindow.screen = newScreen;
        
        self.secondWindow.hidden = NO;
        secondWindow.rootViewController = self;
        [secondWindow makeKeyAndVisible];
        
        // Set the initial UI for the window.
        [self showSecondScreenContent];
    }
}

- (void)handleScreenDidDisconnectNotification:(NSNotification*)aNotification
{
    
    NSLog(@"Disconnect from screen");
    
    if (self.secondWindow)
    {
        // Hide and then delete the window.
        self.secondWindow.hidden = YES;
        self.secondWindow = nil;
        
    }
    
}

- (void) showSecondScreenContent
{
    //handle showing items
    if ( imagePrefix && self.secondWindow) {
        NSLog(@"I am going to look for images with the prefix %@",imagePrefix);
        
        NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:
                          [[NSBundle mainBundle] bundlePath] error:nil];
        foundImagesWithPrefix = [files filteredArrayUsingPredicate:
                                 [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", imagePrefix]];
        
        NSLog(@"%@", foundImagesWithPrefix);
        
        if ([foundImagesWithPrefix count] > 0 ) {
            
            [self cycleImage];
            timer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                     target:self
                                                   selector:@selector(cycleImage)
                                                   userInfo:nil
                                                    repeats:YES];
        }
        
        
    } else {
        
        NSLog(@"There is no content to display yet");
        displayedImage.image = [UIImage imageNamed:@"secondscreenbg"];
    }
    
    
}

- (void)cycleImage
{
    NSString *currentImageName = [foundImagesWithPrefix objectAtIndex:currentImageIndex];
    
    if ( currentImageIndex == [foundImagesWithPrefix count]-1 ) {
        currentImageIndex = 0;
    } else {
        currentImageIndex++;
    }
    
    displayedImage.image = [UIImage imageNamed:currentImageName];
    
}

- (void)turnOffSecondScreen
{
    [timer invalidate];
    foundImagesWithPrefix = nil;
    displayedImage.image = [UIImage imageNamed:@"secondscreenbg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
