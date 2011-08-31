//
//  GLFunAppDelegate.h
//  GLFun
//
//  Created by guo gloria on 11-8-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLFunViewController;

@interface GLFunAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GLFunViewController *viewController;

@end
