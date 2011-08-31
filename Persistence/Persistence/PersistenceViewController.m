//
//  PersistenceViewController.m
//  Persistence
//
//  Created by guo gloria on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PersistenceViewController.h"

@implementation PersistenceViewController
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //pyanfield
    NSString *filePath = [self dataFilePath];
    //check if the data is in the data.plist file . then load the data.
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
        field1.text = [array objectAtIndex:0];
        field2.text = [array objectAtIndex:1];
        field3.text = [array objectAtIndex:2];
        field4.text = [array objectAtIndex:3];
        [array release];
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    //pyanfield : UIApplicationWillResignActiveNotification will be posted whenever an app is no longer the one with which the user is interacting.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
    
    [super viewDidLoad];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:field1.text];
    [array addObject:field2.text];
    [array addObject:field3.text];
    [array addObject:field4.text];
    //save the data
    [array writeToFile:[self dataFilePath] atomically:YES];
    [array release];
}

- (void)viewDidUnload
{
    [self setField1:nil];
    [self setField2:nil];
    [self setField3:nil];
    [self setField4:nil];
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
    [field1 release];
    [field2 release];
    [field3 release];
    [field4 release];
    [super dealloc];
}
@end
