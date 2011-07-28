//
//  SwapViewController.m
//  Swap
//
//  Created by guo gloria on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SwapViewController.h"

@implementation SwapViewController
@synthesize landscape;
@synthesize portrait;
@synthesize portraitFooButton;
@synthesize portraitBarButton;
@synthesize landscapeFooButton;
@synthesize landscapeBarButton;

- (void)dealloc
{
    [landscape release];
    [portrait release];
    [portraitFooButton release];
    [portraitBarButton release];
    [landscapeFooButton release];
    [landscapeBarButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view = self.portrait;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
    } else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else if(toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        self.view = self.portrait;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
    } else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
    }
}

- (IBAction)buttonPressed:(id)sender{
    if(sender == portraitFooButton || sender == landscapeFooButton)
    {
        portraitFooButton.hidden = YES;
        landscapeFooButton.hidden = YES;
        
    }else{
        portraitBarButton.hidden = YES;
        landscapeBarButton.hidden = YES;
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
    [self setLandscape:nil];
    [self setPortrait:nil];
    [self setPortraitFooButton:nil];
    [self setPortraitBarButton:nil];
    [self setLandscapeFooButton:nil];
    [self setLandscapeBarButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
