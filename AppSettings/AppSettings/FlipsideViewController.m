//
//  FlipsideViewController.m
//  AppSettings
//
//  Created by guo gloria on 11-8-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
//pyanfield
#import "MainViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;
@synthesize engineSwitch = _engineSwitch;
@synthesize warpFactorSlider = _warpFactorSlider;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}
//pyanfield : sent the notification when the app display from foreground
- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //pyanfield: sent the notification
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    
    //[self refreshFields];
    //self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];  
}



- (void)refreshFields
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _engineSwitch.on = [[defaults objectForKey:kWarpDriveKey] isEqualToString:@"Engaged"]?YES:NO;
    _warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self setEngineSwitch:nil];
    [self setWarpFactorSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)touchEngineSwitch {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *prefValue = _engineSwitch.on?@"Engaged":@"Disabled";
    [defaults setObject:prefValue forKey:kWarpDriveKey];
    [defaults synchronize];
}

- (IBAction)touchWarpSlider {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:_warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
}

- (void)dealloc {
    [_engineSwitch release];
    [_warpFactorSlider release];
    [super dealloc];
}
@end
