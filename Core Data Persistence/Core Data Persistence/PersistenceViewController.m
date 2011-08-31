//
//  PersistenceViewController.m
//  Core Data Persistence
//
//  Created by guo gloria on 11-8-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PersistenceViewController.h"
#import "Core_Data_PersistenceAppDelegate.h"


@implementation PersistenceViewController
@synthesize line1;
@synthesize line2;
@synthesize line3;
@synthesize line4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    // get a reference to out application delegate, which we then use to get the managed object context that was created for us.
    Core_Data_PersistenceAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
    
    //create a fetch request and pass it the entity description so it knows which type of objects to retrieve.
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    //get every "Line" object in the store
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"There was an error!");
    }
    
    for (NSManagedObject *oneObject in objects) {
        NSNumber *lineNum = [oneObject valueForKey:@"lineNum"];
        NSString *lineText = [oneObject valueForKey:@"lineText"];
        
        NSString *fieldName = [NSString  stringWithFormat:@"line%d",[lineNum integerValue]];
        UITextField *theField = [self valueForKey:fieldName];
        theField.text = lineText;
    }
    [request release];
    
    //when the application is about to move out of the active state so we can save any changes the user has made to the data.
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    Core_Data_PersistenceAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    for (int i=1; i<=4; i++) {
        NSString *fieldName = [NSString stringWithFormat:@"line%d",i];
        UITextField *theField = [self valueForKey:fieldName];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
        [request setEntity:entityDescription];
        
        // check  if there’s already a managed object in the persistent store that corresponds to this field
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(lineNum = %d)",i];
        
        [request setPredicate:pred];
        
        NSManagedObject *theLine = nil;
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        if (objects == nil) {
            NSLog(@"There was an error!");
        }
        
        if ([objects count] > 0) {
            theLine = [objects objectAtIndex:0];
        }else
        {
            theLine = [NSEntityDescription insertNewObjectForEntityForName:@"Line" inManagedObjectContext:context];
        }
        
        [theLine setValue:[NSNumber numberWithInt:i] forKey:@"lineNum"];
        [theLine setValue:theField.text forKey:@"lineText"];
        [request release];
    }
    // tell the context to save its changes
    [context save:&error];
}

- (void)viewDidUnload
{
    [self setLine1:nil];
    [self setLine2:nil];
    [self setLine3:nil];
    [self setLine4:nil];
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
    [line1 release];
    [line2 release];
    [line3 release];
    [line4 release];
    [super dealloc];
}
@end
