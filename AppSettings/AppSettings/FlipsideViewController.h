//
//  FlipsideViewController.h
//  AppSettings
//
//  Created by guo gloria on 11-8-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController {
    UISwitch *_engineSwitch;
    UISlider *_warpFactorSlider;
}


@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UISwitch *engineSwitch;
@property (nonatomic, retain) IBOutlet UISlider *warpFactorSlider;

- (IBAction)done:(id)sender;
- (IBAction)touchEngineSwitch;
- (IBAction)touchWarpSlider;
- (void)refreshFields;
@end
