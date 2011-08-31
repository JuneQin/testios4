//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by guo gloria on 11-8-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@interface QuartzFunView : UIView
{
    CGPoint firstTouch;
    CGPoint lastTouch;
    UIColor *currentColor;
    ShapeType shapeType;
    UIImage *drawImage;
    BOOL useRandomColor;
    //for setNeedsDisplayInRect:
    CGRect redrawRect;
}

@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic, retain) UIColor *currentColor;
@property (nonatomic) ShapeType shapeType;
@property (nonatomic, retain) UIImage *drawImage;
@property (nonatomic) BOOL useRandomColor;

@property (readonly)CGRect currentRect;
@property CGRect redrawRect;

@end
