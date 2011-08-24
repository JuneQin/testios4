//
//  SlowWorkerAppDelegate.h
//  SlowWorker
//
//  Created by guo gloria on 11-8-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlowWorkerViewController;

@interface SlowWorkerAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SlowWorkerViewController *viewController;

@end
