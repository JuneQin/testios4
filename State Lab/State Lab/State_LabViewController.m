//
//  State_LabViewController.m
//  State Lab
//
//  Created by guo gloria on 11-8-24.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "State_LabViewController.h"

@interface State_LabViewController() 

- (void)rotateLabelUp;
- (void)rotateLabelDown;
@end

@implementation State_LabViewController
@synthesize label;
@synthesize smiley,smileyView;
@synthesize segmentedControl;

- (void)rotateLabelUp
{
    //set up an animation.
    [UIView animateWithDuration:0.5 
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
        label.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished){
        if (animate) {
            [self rotateLabelDown];
        }}];
}

- (void)rotateLabelDown
{
    [UIView animateWithDuration:0.5 
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
        label.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished){[self rotateLabelUp];}];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// for tracking the animation
- (void)applicationWillResignActive
{
    NSLog(@">>%@",NSStringFromSelector(_cmd));
    animate = NO;
}

- (void)applicationDidBecomeActive
{
    NSLog(@">>%@",NSStringFromSelector(_cmd));
    animate = YES;
    [self rotateLabelDown];
}

- (void)applicationDidEnterBackground { 
    NSLog(@"%@", NSStringFromSelector(_cmd)); self.smiley = nil;
    self.smileyView.image = nil;
    
    NSInteger selectedIndex = self.segmentedControl.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setInteger:selectedIndex 
                                               forKey:@"selectedIndex"];
}
- (void)applicationWillEnterForeground {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley"
                                                           ofType:@"png"]; self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley; 
}
#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //pyanfield
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground)
                                                 name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
    
    //pyanfield
    //add a Label on the screen
    CGRect bounds = self.view.bounds;
    CGRect labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds)-50, bounds.size.width, 100);
    self.label = [[[UILabel alloc] initWithFrame:labelFrame] autorelease];
    label.font = [UIFont fontWithName:@"Helvetica" size:70];
    label.text = @"Baziga!";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    //add image 
    CGRect smileyFrame = CGRectMake(CGRectGetMidX(bounds)-42, CGRectGetMidY(bounds)/2-42, 84, 84);
    self.smileyView = [[[UIImageView alloc] initWithFrame:smileyFrame] autorelease];
    self.smileyView.contentMode = UIViewContentModeCenter;
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley" ofType:@"png"];
    self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley;
    
    self.segmentedControl = [[[UISegmentedControl alloc] initWithItems:
                              [NSArray arrayWithObjects:
                               @"One", @"Two", @"Three", @"Four", nil]] autorelease];
    self.segmentedControl.frame = CGRectMake(bounds.origin.x + 20, 
                                             CGRectGetMaxY(bounds) - 50,
                                             bounds.size.width - 40, 30);
    
    [self.view addSubview:segmentedControl];
    [self.view addSubview:smileyView];
    [self.view addSubview:label];
    
    NSNumber *indexNumber;
    if (indexNumber == [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedIndex"]) {
        NSInteger selectedIndex = [indexNumber intValue];
        self.segmentedControl.selectedSegmentIndex = selectedIndex;
    }
    //start to rotate
    //[self rotateLabelDown];
}


- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setSmiley:nil];
    [self setSmileyView:nil];
    [self setSegmentedControl:nil];
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
    [label release];
    [smiley release];
    [smileyView release];
    [segmentedControl release];
    [super dealloc];
}
@end
