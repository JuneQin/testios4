//
//  CustomPickerViewController.h
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface CustomPickerViewController : UIViewController 
    <UIPickerViewDelegate,UIPickerViewDataSource>
{
    
    UIPickerView *picker;
    UILabel *winLabel;
    
    NSArray *colum1;
    NSArray *colum2;
    NSArray *colum3;
    NSArray *colum4;
    NSArray *colum5;
    
    UIButton *button;
    SystemSoundID crunchSoundID;
    SystemSoundID winSoundID;
}
@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) IBOutlet UILabel *winLabel;
@property (nonatomic, retain) NSArray *colum1;
@property (nonatomic, retain) NSArray *colum2;
@property (nonatomic, retain) NSArray *colum3;
@property (nonatomic, retain) NSArray *colum4;
@property (nonatomic, retain) NSArray *colum5;

@property (nonatomic, retain) IBOutlet UIButton *button;

//pyandielf: carfully here , no "retain" 
@property (nonatomic) SystemSoundID crunchSoundID;
@property (nonatomic) SystemSoundID winSoundID;
- (IBAction)buttonPressed;

@end
