//
//  SwapAppDelegate.h
//  Swap
//
//  Created by guo gloria on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwapViewController;

@interface SwapAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SwapViewController *viewController;

@end
