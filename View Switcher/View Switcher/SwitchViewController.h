//
//  SwitchViewController.h
//  View Switcher
//
//  Created by guo gloria on 11-7-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YellowViewController;
@class BlueViewController;

@interface SwitchViewController : UIViewController {
    YellowViewController *yellowViewController;
    BlueViewController *blueViewController;
}

@property (nonatomic,retain) YellowViewController *yellowViewController;
@property (nonatomic,retain) BlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;
@end
