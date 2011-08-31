//
//  State_LabViewController.h
//  State Lab
//
//  Created by guo gloria on 11-8-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


// for this app need to debug on the real device not simulator.
@interface State_LabViewController : UIViewController {
    //for tracking the animating
    BOOL animate;
    
    UILabel *label;
    UIImage *smiley;
    UIImageView *smileyView;
    UISegmentedControl *segmentedControl;
}

@property (nonatomic, retain)  UILabel *label;
@property (nonatomic, retain)  UIImage *smiley;
@property (nonatomic, retain)  UIImageView *smileyView;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;

@end
