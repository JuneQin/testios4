//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by guo gloria on 11-7-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyViewController;

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic,retain) MyViewController *myViewController;

@end
