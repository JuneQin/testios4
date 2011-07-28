//
//  AutoSizeViewController.m
//  AutoSize
//
//  Created by guo gloria on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AutoSizeViewController.h"

@implementation AutoSizeViewController
@synthesize bt1;
@synthesize bt2;
@synthesize bt3;
@synthesize bt4;
@synthesize bt5;
@synthesize bt6;

- (void)dealloc
{
    [bt1 release];
    [bt2 release];
    [bt3 release];
    [bt4 release];
    [bt5 release];
    [bt6 release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


//pyanfield : you can remove this function to see what happened when you change the mode
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        bt1.frame = CGRectMake(20,20, 125, 125);
        bt2.frame = CGRectMake(175, 20, 125, 125);
        bt3.frame = CGRectMake(20, 168, 125, 125);
        bt4.frame = CGRectMake(175, 168, 125, 125);
        bt5.frame = CGRectMake(20, 315, 125, 125);
        bt6.frame = CGRectMake(175, 315, 125, 125);
        
    } else {
        bt1.frame = CGRectMake(20,20, 125, 125);
        bt2.frame = CGRectMake(20, 155, 125, 125);
        bt3.frame = CGRectMake(177, 20, 125, 125);
        bt4.frame = CGRectMake(177, 155, 125, 125);
        bt5.frame = CGRectMake(328, 20, 125, 125);
        bt6.frame = CGRectMake(328, 155, 125, 125);
    }
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setBt1:nil];
    [self setBt2:nil];
    [self setBt3:nil];
    [self setBt4:nil];
    [self setBt5:nil];
    [self setBt6:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    //pyanfield: support potrait mode and landscape mode in both directions but not rotation to the 
    //upside-down portrait mode
    return (interfaceOrientation!= UIInterfaceOrientationPortraitUpsideDown);
}

@end
