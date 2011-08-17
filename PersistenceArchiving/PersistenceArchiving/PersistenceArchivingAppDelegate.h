//
//  PersistenceArchivingAppDelegate.h
//  PersistenceArchiving
//
//  Created by guo gloria on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceArchivingViewController;

@interface PersistenceArchivingAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PersistenceArchivingViewController *viewController;

@end
