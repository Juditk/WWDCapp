//
//  JKGSafetyVideoViewController.h
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JKGSafetyVideoViewController : UIViewController <AVSpeechSynthesizerDelegate>
{
    UIImageView *currentImage;
    AVSpeechSynthesizer *synthesizer;
    NSArray *speechStrings;
    int currentSpeechItem;
    
}

@property (nonatomic, strong) IBOutlet UIImageView *currentImage;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

- (IBAction)skipSafeyBriefing:(id)sender;

@end
