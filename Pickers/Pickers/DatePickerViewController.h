//
//  DatePickerViewController.h
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePickerViewController : UIViewController {
    UIDatePicker *datePicker;
    
}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed;

@end
