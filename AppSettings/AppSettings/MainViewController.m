//
//  MainViewController.m
//  AppSettings
//
//  Created by guo gloria on 11-8-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize usernameLabel;
@synthesize passwordLabel;
@synthesize protocolLabel;
@synthesize warpDriveLabel;
@synthesize warpFactorLabel;
@synthesize favoriteTeaLabel;
@synthesize favoriteCandyLabel;
@synthesize favoriteGameLabel;
@synthesize favoriteExcuseLabel;
@synthesize favoriteSinLabel;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

- (void)refreshFields
{
    //pyanfield: this is the main instance for getting the setting 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    usernameLabel.text = [defaults objectForKey:kUsernameKey];
    passwordLabel.text = [defaults objectForKey:kPasswordKey];
    protocolLabel.text = [defaults objectForKey:kProtocolKey];
    warpDriveLabel.text = [defaults objectForKey:kWarpDriveKey];
    warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey] stringValue];
    favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    favoriteCandyLabel.text = [defaults objectForKey:kFavoriteCandyKey];
    favoriteGameLabel.text = [defaults objectForKey:kFavoriteGameKey];
    favoriteExcuseLabel.text = [defaults objectForKey:kFavoriteExcuseKey];
    favoriteSinLabel.text = [defaults objectForKey:kFavoriteSinKey];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refreshFields];
    [super viewDidAppear:animated];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    //pyanfield
    [self refreshFields];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self setUsernameLabel:nil];
    [self setPasswordLabel:nil];
    [self setProtocolLabel:nil];
    [self setWarpDriveLabel:nil];
    [self setWarpFactorLabel:nil];
    [self setFavoriteTeaLabel:nil];
    [self setFavoriteCandyLabel:nil];
    [self setFavoriteGameLabel:nil];
    [self setFavoriteExcuseLabel:nil];
    [self setFavoriteSinLabel:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [usernameLabel release];
    [passwordLabel release];
    [protocolLabel release];
    [warpDriveLabel release];
    [warpFactorLabel release];
    [favoriteTeaLabel release];
    [favoriteCandyLabel release];
    [favoriteGameLabel release];
    [favoriteExcuseLabel release];
    [favoriteSinLabel release];
    [super dealloc];
}
@end
