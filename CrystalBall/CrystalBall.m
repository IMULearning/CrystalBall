//
//  CrystalBall.m
//  CrystalBall
//
//  Created by Weinan Qiu on 2014-10-05.
//  Copyright (c) 2014 Eland. All rights reserved.
//

#import "CrystalBall.h"
#import <UIKit/UIColor.h>

@implementation CrystalBall

- (NSArray *) predictions {
    if (_predictions == nil) {
        _predictions = @[
                         @"It is certain",
                         @"It is decidedly so",
                         @"All sign says yes",
                         @"Better not tell you now",
                         @"Unable to answer now"
                         ];
    }
    
    return _predictions;
}

- (NSArray *) colors {
    if (_colors == nil) {
        _colors = @[
                    [UIColor redColor],
                    [UIColor greenColor],
                    [UIColor blueColor],
                    [UIColor grayColor],
                    [UIColor blackColor],
                    [UIColor purpleColor]
                    ];
    }
    return _colors;
}

- (NSString *) randomPrediction {
    int randomPredictionIndex = arc4random_uniform([self predictions].count);
    return [[self predictions] objectAtIndex:randomPredictionIndex];
}

- (UIColor *) randomColor {
    int randomColorIndex = arc4random_uniform([self colors].count);
    return [[self colors] objectAtIndex:randomColorIndex];
}

@end
