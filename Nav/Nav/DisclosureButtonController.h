//
//  DisclosureButtonController.h
//  Nav
//
//  Created by guo gloria on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@class DisclosureDetailController;

@interface DisclosureButtonController : SecondLevelViewController
{
    NSArray *list;
    DisclosureDetailController *childController;
}

@property (nonatomic, retain) NSArray *list;

@end
