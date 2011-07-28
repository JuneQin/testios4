//
//  SingleComponentPickerViewController.h
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleComponentPickerViewController : UIViewController
    <UIPickerViewDelegate,UIPickerViewDataSource>{
    
    UIPickerView *singlePicker;
    NSArray *pickerData;
}
@property (nonatomic, retain) NSArray *pickerData;
@property (nonatomic, retain) IBOutlet UIPickerView *singlePicker;
- (IBAction)buttonPressed;

@end
