//
//  ControlFunViewController.m
//  ControlFun
//
//  Created by guo gloria on 11-7-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ControlFunViewController.h"


@implementation ControlFunViewController
@synthesize nameField;
@synthesize numberField;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize doSomethingButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)textFieldDoneEditing:(id)sender{
    //pyanfield : add "textFieldDoneEditing" to "First Responser" and connecting to the Event "Did End On Exit"
    [sender resignFirstResponder];
}
//pyanfield : when you tap the space outside the Keyboard, the keyboard will disappeared.
- (IBAction)backgroundTap:(id)sender{
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value+0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt];
    sliderLabel.text = newText;
    [newText release];
    
}

- (IBAction)buttonPressed:(id)sender {
    //pyanfield : the argument "delegate" is the delegate for the action sheet. here, the delegate is self.so will call "actionSheet:didDismissWithButtonIndex" function in this .m file.
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"NO way" destructiveButtonTitle:@"Yes,I'm sure!" otherButtonTitles:nil];
    
    //pyanfield : self.view is the parent of actionSheet.
    [actionSheet showInView:self.view];
    [actionSheet retain];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if (nameField.text.length>0) {
            msg = [[NSString alloc] initWithFormat:@"You can breathe esay,%@,everything went ok.",nameField.text];
        }else
        {
            msg = @"you can breathe easy, everything went ok.";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"Phew" otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release];
    }
}

- (IBAction)toggleControls:(id)sender {
    if([sender selectedSegmentIndex] == kSwitchesSegmentIndex)
    {
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        doSomethingButton.hidden = YES;
    }else
    {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        doSomethingButton.hidden = NO;
    }
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwith = (UISwitch *)sender;
    BOOL setting = whichSwith.isOn;
    
    //pyanfield: animated lets us specify whether the button should slide over slowly
    [leftSwitch setOn:setting animated:NO];
    [rightSwitch setOn:setting animated:YES];
}
- (void)dealloc
{
    [nameField release];
    [numberField release];
    [sliderLabel release];
    [leftSwitch release];
    [rightSwitch release];
    [doSomethingButton release];
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
    //[super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //pyanfield: set te doSomethingButton with customzied image UI
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];

}

- (void)viewDidUnload
{
    //pyanfield : will call this function when this view disappeared
    [self setNameField:nil];
    [self setNumberField:nil];
    [self setSliderLabel:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [self setDoSomethingButton:nil];
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
