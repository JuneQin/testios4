//
//  DatePickerViewController.m
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DatePickerViewController.h"


@implementation DatePickerViewController
@synthesize datePicker;

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
    [datePicker release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (IBAction)buttonPressed
{
    NSDate *selected = [datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is :%@",selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date Time Selected" message:message delegate:nil cancelButtonTitle:@"Yes,I did" otherButtonTitles:nil];
    [alert show];
    [alert release];
    [message release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSDate *now = [[NSDate alloc] init];
    [datePicker setDate:now animated:NO];
    [now retain];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.datePicker = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
