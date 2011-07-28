//
//  ControlFunAppDelegate.h
//  ControlFun
//
//  Created by guo gloria on 11-7-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControlFunViewController;
@interface ControlFunAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

//pyanfield
@property (nonatomic, retain) ControlFunViewController *cfViewController;

@end
