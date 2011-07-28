//
//  ControlFunViewController.h
//  ControlFun
//
//  Created by guo gloria on 11-7-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//pyanfield : all file created by pyanfield
#define kSwitchesSegmentIndex    0

@interface ControlFunViewController : UIViewController <UIActionSheetDelegate>{
    
    UITextField *nameField;
    UITextField *numberField;
    UILabel *sliderLabel;
    UISwitch *leftSwitch;
    UISwitch *rightSwitch;
    UIButton *doSomethingButton;
}
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *numberField;
@property (nonatomic, retain) IBOutlet UILabel *sliderLabel;
@property (nonatomic, retain) IBOutlet UISwitch *leftSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *rightSwitch;
@property (nonatomic, retain) IBOutlet UIButton *doSomethingButton;


- (IBAction)textFieldDoneEditing:(id)sender;

//pyanfield : when tap the background call this method
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)buttonPressed:(id)sender;
//pyanfield : segmented Control component event
- (IBAction)toggleControls:(id)sender;
//pyanfield : switch component
- (IBAction)switchChanged:(id)sender;

@end
