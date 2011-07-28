//
//  SwitchViewController.m
//  View Switcher
//
//  Created by guo gloria on 11-7-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"

@implementation SwitchViewController
@synthesize yellowViewController;
@synthesize blueViewController;


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
    [yellowViewController release];
    [blueViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    
    //pyanfield
    if (self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

- (IBAction)switchViews:(id)sender
{
    //pyanfield: below code is used for animation of switching the view
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    
    if (self.yellowViewController.view.superview == nil) {
        if (self.yellowViewController == nil) {
            YellowViewController *yellowController = [[YellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
            self.yellowViewController = yellowController;
            [yellowController release];
        }
        
        //for animation
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [blueViewController viewWillAppear:YES];
        [yellowViewController viewWillDisappear:YES];
        
        [blueViewController.view removeFromSuperview];
        [self.view insertSubview:yellowViewController.view atIndex:0];
        
        //for animation
        [yellowViewController viewDidDisappear:YES];
        [blueViewController viewDidAppear:YES];
    } else {
        if (self.blueViewController == nil) {
            BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
            self.blueViewController = blueController;
            [blueController release];
        }
        
        //for annimation
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [yellowViewController viewWillAppear:YES];
        [blueViewController viewWillDisappear:YES];
        
        [yellowViewController.view removeFromSuperview];
        [self.view insertSubview:blueViewController.view atIndex:0];
        
        //for animation
        [blueViewController viewDidDisappear:YES];
        [yellowViewController viewDidAppear:YES];
    }
    //for animation
    [UIView commitAnimations];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
    self.blueViewController = blueController;
    [self.view insertSubview:blueController.view atIndex:0];
    [blueController release];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
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
