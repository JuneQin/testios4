//
//  DeleteMeController.h
//  Nav
//
//  Created by guo gloria on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface DeleteMeController : SecondLevelViewController
{
    NSMutableArray *list;
}

@property (nonatomic, retain)NSMutableArray *list;
- (IBAction)toggleEdit:(id)sender;

@end
