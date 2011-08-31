//
//  PresidentDetailController.m
//  Nav
//
//  Created by guo gloria on 11-8-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PresidentDetailController.h"
#import "President.h"

@implementation PresidentDetailController

@synthesize president;
@synthesize fieldLabels;
@synthesize tempValues;
@synthesize textFieldBeingEdited;

//When the Cancel button is tapped, the current view will be popped off the stack, and the previous view will rise to the top of the stack.
- (IBAction)cancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender
{
    // pyanfield: check to see if there is a text field that is currently being edited. Whenever the user starts editing a text field, we store a pointer to that text field in textFieldBeingEdited. If textFieldBeingEdited is not nil, we grab its value and stick it in tempValues.
    if (textFieldBeingEdited !=nil) {
        NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textFieldBeingEdited.tag];
        
        [tempValues setObject:textFieldBeingEdited forKey:tagAsNum];
        [tagAsNum release];
    }
    
    //pyanfield : We can’t store raw datatypes like int in an NSDictionary, so we create NSNumber objects based on the row number and use those instead
    for (NSNumber *key in [tempValues allKeys]) {
        switch ([key intValue]) {
            case kNameRowIndex:
                president.name = [tempValues objectForKey:key];
                break;
            case kFromYearRowIndex:
                president.fromYear = [tempValues objectForKey:key];
                break;
            case kToYearRowIndex:
                president.toYear = [tempValues objectForKey:key];
                break;
            case kPartyIndex:
                president.party = [tempValues objectForKey:key];
                break;
            default:
                break;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    //pyanfield : tell the parent to reload the data to update the changes
    //UINavigationController *navController = [delegate navController];
    //NSArray *allControllers = navController.viewControllers;
    NSArray *allControllers = self.navigationController.viewControllers;
    UITableViewController *parent = [allControllers lastObject];
    [parent.tableView reloadData];
}

//pyanfield : user taps the Done button on the keyboard.
//- (IBAction)textFieldDone:(id)sender
//{
//    [sender resignFirstResponder];
//}

// for p338
- (IBAction)textFieldDone:(id)sender
{
    //Our sender’s superview is the content view that groups the text field and its label. And sender’s superview’s superview is the cell that encompasses that content view.
    UITableViewCell *cell = (UITableViewCell *)[[sender superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    
    NSIndexPath *textFieldIndexPath = [table indexPathForCell:cell];
    NSInteger row = [textFieldIndexPath row];
    row++;
    if (row>=kNumberOfEditableRows) {
        row = 0;
    }
    
    NSIndexPath *newPath = [NSIndexPath indexPathForRow:row inSection:0];
    UITableViewCell *nextCell = [self.tableView cellForRowAtIndexPath:newPath];
    UITextField *nextField = nil;
    for(UIView *oneView in nextCell.contentView.subviews)
    {
        if ([oneView isMemberOfClass:[UITextField class]]) {
            nextField = (UITextField *)oneView;
        }
    }
    
    [nextField becomeFirstResponder];
}


//#pragma mark -
- (void)viewDidLoad {
    NSArray *array = [[NSArray alloc] initWithObjects:@"Name:", @"From:",
                      @"To:", @"Party:", nil];
    self.fieldLabels = array;
    [array release];
	
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithTitle:@"Cancel"
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
	
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Save"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
	
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    self.tempValues = dict;
    [dict release];
    [super viewDidLoad];
}

- (void)dealloc {
    [president release];
    [fieldLabels release];
    [tempValues release];
    [textFieldBeingEdited release];
    [super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return kNumberOfEditableRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *PresidentCellIdentifier = @"PresidentCellIdentifier";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             PresidentCellIdentifier];
    if (cell == nil) {
		
        //pyanfield : create a new cell,lable is on the right side. textfield is on the left side.
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:PresidentCellIdentifier] autorelease];
        UILabel *label = [[UILabel alloc] initWithFrame:
						  CGRectMake(10, 10, 75, 25)];
        label.textAlignment = UITextAlignmentRight;
        label.tag = kLabelTag;    // assign a tag for retrieve later.
        label.font = [UIFont boldSystemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label release];
		
        UITextField *textField = [[UITextField alloc] initWithFrame:
                                  CGRectMake(90, 12, 200, 25)];
        textField.clearsOnBeginEditing = NO;
        [textField setDelegate:self];
        //set the keyboard's return key type, the default is "Return",now we set it as "Done" to replace default one.
        //textField.returnKeyType = UIReturnKeyDone;
        
        //pyanfield : tell the text field to call our textFieldDone: method on the Did End on Exit event. This is exactly the same thing as dragging from the Did End on Exit event in the connections inspector in Interface Builder to File’s Owner and selecting an action method. Since we don’t have a nib file, we must do it programmatically, but the result is the same.
        [textField addTarget:self
                      action:@selector(textFieldDone:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
        [cell.contentView addSubview:textField];
    }
    NSUInteger row = [indexPath row];
	// get a reference to label inside this cell.
    UILabel *label = (UILabel *)[cell viewWithTag:kLabelTag];
    
    //pyanfield : we need the tag in order to tell our text field delegates which text field is calling them. So, we’re going to rely on the fact that there’s only one text field that is a subview of our cell’s contentView. We’ll use fast enumeration to work through all of its subviews, and when we find a text field, we assign it to the pointer we declared a moment earlier. When the loop is done, the textField pointer should be pointing to the one and only text field contained in this cell.
    UITextField *textField = nil;
    for (UIView *oneView in cell.contentView.subviews) {
        if ([oneView isMemberOfClass:[UITextField class]])
            textField = (UITextField *)oneView;
    }
    
    
    label.text = [fieldLabels objectAtIndex:row];
    NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:row];
    switch (row) {
        case kNameRowIndex:
            // if tempValues has the value, then indicate that the value changed, so using the tempValues to update. if not,using the president value.
            if ([[tempValues allKeys] containsObject:rowAsNum])
                textField.text = [tempValues objectForKey:rowAsNum];
            else
                textField.text = president.name;
            break;
        case kFromYearRowIndex:
            if ([[tempValues allKeys] containsObject:rowAsNum])
                textField.text = [tempValues objectForKey:rowAsNum];
            else
                textField.text = president.fromYear;
			break;
        case kToYearRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues objectForKey:rowAsNum];
			else
				textField.text = president.toYear;
			break;
        case kPartyIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues objectForKey:rowAsNum];
			else
				textField.text = president.party;
        default:
            break;
    }
    
    if (textFieldBeingEdited == textField) {
        textFieldBeingEdited = nil;
    }
    textField.tag = row;
    [rowAsNum release];
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
// not highlighted the row when selected the row
- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark Text Field Delegate Methods
// store a pointer to the field currently being edited
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.textFieldBeingEdited = textField;
}
//is called when the user stops editing a text field by tapping a different text field or pressing the Done button, or when another field became the first responder
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textField.tag];
    [tempValues setObject:textField.text forKey:tagAsNum];
    [tagAsNum release];
}



@end
