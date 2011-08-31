//
//  PersistenceArchivingViewController.m
//  PersistenceArchiving
//
//  Created by guo gloria on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PersistenceArchivingViewController.h"
#import "FourLines.h"

@implementation PersistenceArchivingViewController
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
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [array objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:filePath];
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        FourLines *fourLines = [unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding];
        
        field1.text = fourLines.field1;
        field2.text = fourLines.field2;
        field3.text = fourLines.field3;
        field4.text = fourLines.field4;
        
        [unarchiver release];
        [data release];
    }
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationWillResignActive:)
												 name:UIApplicationWillResignActiveNotification
											   object:app];
    [super viewDidLoad];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    FourLines *fourLines = [[FourLines alloc] init];
    fourLines.field1 = field1.text;
    fourLines.field2 = field2.text;
    fourLines.field3 = field3.text;
    fourLines.field4 = field4.text;
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:fourLines forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
    [fourLines release];
    [archiver release];
    [data release];
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
