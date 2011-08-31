//
//  PresidentsViewController.h
//  Nav
//
//  Created by guo gloria on 11-8-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondLevelViewController.h"

@interface PresidentsViewController : SecondLevelViewController
{
    NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;
@end
