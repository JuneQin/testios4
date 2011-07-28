//
//  AutoSizeAppDelegate.h
//  AutoSize
//
//  Created by guo gloria on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutoSizeViewController;

@interface AutoSizeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AutoSizeViewController *viewController;

@end
