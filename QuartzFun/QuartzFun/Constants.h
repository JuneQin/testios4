//
//  Constants.h
//  QuartzFun
//
//  Created by guo gloria on 11-8-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

typedef enum{
    kLineShap = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
} ShapeType;

typedef enum{
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
} ColorTabIndex;

#define degreesToRadian(x) (M_PI*(x)/180.0)
