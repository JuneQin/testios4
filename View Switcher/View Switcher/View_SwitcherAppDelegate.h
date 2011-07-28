//
//  View_SwitcherAppDelegate.h
//  View Switcher
//
//  Created by guo gloria on 11-7-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchViewController;

@interface View_SwitcherAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SwitchViewController *switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet SwitchViewController *switchViewContoller;
@end
