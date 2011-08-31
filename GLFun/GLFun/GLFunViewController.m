//
//  GLFunViewController.m
//  GLFun
//
//  Created by guo gloria on 11-8-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GLFunViewController.h"
#import "GLFunView.h"
#import "Constants.h"

@implementation GLFunViewController
@synthesize colorControl;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
    [self setColorControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [colorControl release];
    [super dealloc];
}
- (IBAction)changeColor:(id)sender {
    UISegmentedControl *control = sender;
    NSInteger index = [control selectedSegmentIndex];
    
    //pyanfield: this is the only different with QuartzFunView
    GLFunView *glView = (GLFunView *)self.view;
    
    switch (index) {
        case kRedColorTab:
            glView.currentColor = [UIColor redColor];
            glView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            glView.currentColor = [UIColor blueColor];
            glView.useRandomColor = NO;
            break;
        case kYellowColorTab:
            glView.currentColor = [UIColor yellowColor];
            glView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            glView.currentColor = [UIColor greenColor];
            glView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            glView.useRandomColor = YES;
            break;
        default:
            break;
    }
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender;
    
    //pyanfield: this is the only different with QuartzFunView
    [(GLFunView *)self.view setShapeType:[control selectedSegmentIndex]];
    
    if ([control selectedSegmentIndex] == kImageShape) {
        colorControl.hidden = YES;
    } else {
        colorControl.hidden = NO;
    }
}
@end
