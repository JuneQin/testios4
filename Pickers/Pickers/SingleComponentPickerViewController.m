//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SingleComponentPickerViewController.h"


@implementation SingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

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
    [singlePicker release];
    [pickerData release];
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
    NSArray *array = [[NSArray alloc] initWithObjects:@"Gerrard",@"Kuyt",@"Adam",@"Henderson",@"Lucas",@"Agger",@"Carrage",@"Reina",@"Surase",@"Glen",@"Flanagan",@"Carrel", nil];
    self.pickerData = array;
    [array release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSinglePicker:nil];
    [self setPickerData:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed {
    
    //pyanfield : "0" indecate that the first component.
    NSInteger row = [singlePicker selectedRowInComponent:0];
    NSString *selected = [pickerData objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!",selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"thank you for choosing." delegate:nil cancelButtonTitle:@"You are welcome" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [title release];
    
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{   
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [pickerData objectAtIndex:row];
}
@end
