//
//  DoubleComponentPickerViewController.h
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreakComponent 1

@interface DoubleComponentPickerViewController : UIViewController 
    <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *fillingTypes;
    NSArray *breadTypes;
    UIPickerView *doublePicker;
}
- (IBAction)buttonPressed;
@property (nonatomic, retain) IBOutlet UIPickerView *doublePicker;
@property (nonatomic, retain) NSArray *fillingTypes;
@property (nonatomic, retain) NSArray *breadTypes;
@end
