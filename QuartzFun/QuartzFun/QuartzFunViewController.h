//
//  QuartzFunViewController.h
//  QuartzFun
//
//  Created by guo gloria on 11-8-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzFunViewController : UIViewController {
    UISegmentedControl *colorControl;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *colorControl;
- (IBAction)changeColor:(id)sender;
- (IBAction)changeShape:(id)sender;

@end
