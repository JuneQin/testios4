//
//  MyViewController.m
//  HelloWorld
//
//  Created by guo gloria on 11-7-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"


@implementation MyViewController

@synthesize label;
@synthesize userName;
@synthesize textField;

-(BOOL) textFieldShouldReturn:(UITextField*)theTextField
{
    if (theTextField == textField) {
        [textField resignFirstResponder];
    }
    return YES;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)chengeGreeting:(id)sender {
    self.userName = textField.text;
    NSString *nameString = self.userName;
    if ([nameString length] == 0) {
        nameString = @"World";
    }
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello,%@!",nameString];
    label.text = greeting;
    [greeting release];
}

- (void)dealloc
{
    [textField release];
    [label release];
    [userName release];
    [textField release];
    [label release];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
