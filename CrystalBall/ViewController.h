//
//  ViewController.h
//  CrystalBall
//
//  Created by Weinan Qiu on 2014-10-04.
//  Copyright (c) 2014 Eland. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward declaration
@class CrystalBall;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) CrystalBall *crystalBall;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)buttonPressed;

@end

