//
//  PresidentDetailController.h
//  Nav
//
//  Created by guo gloria on 11-8-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

//pyanfield : p325
#import <UIKit/UIKit.h>

@class President;


#define kNumberOfEditableRows         4
#define kNameRowIndex                 0
#define kFromYearRowIndex             1
#define kToYearRowIndex               2
#define kPartyIndex                   3


// pyanfield : we’ll use to retrieve the UILabel from the cell so that we can set the label correctly for the row.
#define kLabelTag                     4096

// UITextFieldDelegate, we’ll be notified when a user makes a change to a text field so that we can save the field’s value

@interface PresidentDetailController : UITableViewController
<UITextFieldDelegate> {
    
    //pyanfield : set value in the PresidentViewController tableView:didSelectRowAtIndexPath:
    President *president;
    
    //pyanfield : fieldLabels, is an array that holds a list of labels that correspond to the constants kNameRowIndex, kFromYearRowIndex, kToYearRowIndex, and kPartyIndex. For example, kNameRowIndex is defined as 0. So, the label for the row that shows the president’s name is stored at index 0 in the fieldLabels array. 
    NSArray *fieldLabels;
    
    //pyanfield : hold the values from fields the user changes
    NSMutableDictionary *tempValues;
    
    //pyanfield : why do we need this point to UITextField? p326
    UITextField *textFieldBeingEdited;
}
@property (nonatomic, retain) President *president;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)textFieldDone:(id)sender;

@end
