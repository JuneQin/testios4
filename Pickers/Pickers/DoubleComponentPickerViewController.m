//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"


@implementation DoubleComponentPickerViewController
@synthesize doublePicker;
@synthesize fillingTypes;
@synthesize breadTypes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [doublePicker release];
    [breadTypes release];
    [fillingTypes release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSArray *fillingArray = [[NSArray alloc] initWithObjects:@"Ham",@"Turkey",@"Peanut Butter",@"Tuna Salad",@"Nuttle",@"Roast Beef",@"Vegemite", nil];
    self.fillingTypes = fillingArray;
    [fillingArray release];
    
    NSArray *breadArray = [[NSArray alloc] initWithObjects:@"White",@"Whole wheat",@"Rye",@"Sourdough",@"Seven Grain", nil];
    self.breadTypes = breadArray;
    [breadArray release];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDoublePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.doublePicker = nil;
    self.breadTypes = nil;
    self.fillingTypes = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed {
    NSInteger fillingRow = [doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [doublePicker selectedRowInComponent:kBreakComponent];
    NSString *bread = [breadTypes objectAtIndex:breadRow];
    NSString *filling = [fillingTypes objectAtIndex:fillingRow];
    
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up.",filling,bread];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thanks for your order" message:message delegate:nil cancelButtonTitle:@"Great!" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    [message release];
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kBreakComponent) {
        return [self.breadTypes count];
    }
    
    return [self.fillingTypes count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kBreakComponent) {
        return  [self.breadTypes objectAtIndex:row];
    }
    return [self.fillingTypes objectAtIndex:row];
}

@end
