//
//  UIColor-Random.m
//  QuartzFun
//
//  Created by guo gloria on 11-8-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIColor-Random.h"

// this can be reused by other ios app
@implementation UIColor (Random)

+ (UIColor *)randomColor
{
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        srandom(time(NULL));
    }
    //generate three random CGFloats with a value between 0.0 and 1.0
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end
