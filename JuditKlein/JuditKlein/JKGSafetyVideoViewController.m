//
//  JKGSafetyVideoViewController.m
//  JuditKlein
//
//  Created by Judit Klein on 5/04/14.
//  Copyright (c) 2014 juditk. All rights reserved.
//

#import "JKGSafetyVideoViewController.h"

@interface JKGSafetyVideoViewController ()

@end

@implementation JKGSafetyVideoViewController

@synthesize currentImage,synthesizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpStringToSpeak
{

    //Load the content of the plist into an array
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"speechCommands" ofType:@"plist"];
    
    speechStrings = [NSArray arrayWithContentsOfFile:path];
    
    if ( speechStrings ) {
        currentSpeechItem = 0;
    } else {
        NSLog (@"No strings to speak were found");
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpStringToSpeak];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    currentImage.image = [UIImage imageNamed:@"flightSafety0"];
    [self speakLine:[speechStrings objectAtIndex:currentSpeechItem]];
    currentSpeechItem++;
}

-(void)speakLine:(NSString*)lineToSpeak
{
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:lineToSpeak];
//    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.rate = .50;
    [synthesizer speakUtterance:utterance];
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    if ( currentSpeechItem <= [speechStrings count]-1 )
    {
        currentImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"flightSafety%d",currentSpeechItem]];
        [self speakLine:[speechStrings objectAtIndex:currentSpeechItem]];
        currentSpeechItem ++;
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipSafeyBriefing:(id)sender
{
    NSLog(@"Skip safety briefing");
    [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    self.synthesizer = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
