//
//  SectionsAppDelegate.h
//  Sections
//
//  Created by guo gloria on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionsViewController;

@interface SectionsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SectionsViewController *viewController;

@end
