//
//  DependentComponentPickerViewController.h
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStateComponent 0
#define kZipComponent 1

@interface DependentComponentPickerViewController : UIViewController 
    <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSDictionary *stateZips;
    NSArray *states;
    NSArray *zips;
    UIPickerView *picker;
}
@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) NSDictionary *stateZips;
@property (nonatomic, retain) NSArray *states;
@property (nonatomic, retain) NSArray *zips;
- (IBAction)buttonPressed;

@end
