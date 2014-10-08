//
//  CrystalBall.h
//  CrystalBall
//
//  Created by Weinan Qiu on 2014-10-05.
//  Copyright (c) 2014 Eland. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;

@interface CrystalBall : NSObject {
    NSArray *_predictions;
    NSArray *_colors;
}

//@property (nonatomic, strong, readonly) NSArray *predictions;
//@property (nonatomic, strong, readonly) NSArray *colors;

- (NSString *) randomPrediction;
- (UIColor *) randomColor;

@end
