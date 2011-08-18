//
//  PersistenceSQLiteAppDelegate.h
//  PersistenceSQLite
//
//  Created by guo gloria on 11-8-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceSQLiteViewController;

@interface PersistenceSQLiteAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PersistenceSQLiteViewController *viewController;

@end
