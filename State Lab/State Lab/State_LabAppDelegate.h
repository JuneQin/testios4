//
//  State_LabAppDelegate.h
//  State Lab
//
//  Created by guo gloria on 11-8-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class State_LabViewController;

@interface State_LabAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet State_LabViewController *viewController;

@end
