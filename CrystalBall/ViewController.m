//
//  ViewController.m
//  CrystalBall
//
//  Created by Weinan Qiu on 2014-10-04.
//  Copyright (c) 2014 Eland. All rights reserved.
//

#import "ViewController.h"
#import "CrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

- (void) makePrediction;

@end

@implementation ViewController {
    SystemSoundID _soundEffect;
    AVAudioPlayer *_soundFX;
}

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crystalBall = [[CrystalBall alloc] init];
    
    self.backgroundImageView.animationImages = [self backgroundImagesArray];
    self.backgroundImageView.animationDuration = 2.0f;
    self.backgroundImageView.animationRepeatCount = 1;
    
    //[self initSoundEffect2];
    [self initSoundEffect2];
    
}

- (void) initSoundEffect {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &_soundEffect);
}

- (void) initSoundEffect2 {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    _soundFX = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
}

- (NSArray *)backgroundImagesArray {
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 10; i++) {
        NSString *imageName = [@"CB0000" stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
        [imageArray insertObject:[UIImage imageNamed:imageName] atIndex:i - 1];
    }
    for (int i = 10; i <= 60; i++) {
        NSString *imageName = [@"CB000" stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
        [imageArray insertObject:[UIImage imageNamed:imageName] atIndex:i - 1];
    }
    return imageArray;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Control events

- (IBAction)buttonPressed {
    [self makePrediction];
}

#pragma mark - Prediction

- (void)addBackgroundImageView {
    UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    [self.view insertSubview:imageView atIndex:0];
}

- (void) makePrediction {
    [self.backgroundImageView startAnimating];

    [self.predictionLabel setText:[self.crystalBall randomPrediction]];
    [self.predictionLabel setTextColor:[self.crystalBall randomColor]];
    
    // AudioServicesPlaySystemSound(_soundEffect);
    [_soundFX play];
    [UIView animateWithDuration:6.0 animations:^{
        [self.predictionLabel setAlpha:1.0f];
    }];
}


#pragma mark - Motion events

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self.predictionLabel setText:nil];
    [self.predictionLabel setAlpha:0.0f];
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion cancelled");
}

#pragma mark - Touch events

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.predictionLabel setText:nil];
    [self.predictionLabel setAlpha:0.0f];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch cancelled");
}

@end
