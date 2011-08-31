//
//  DetailViewController.m
//  Presidents
//
//  Created by guo gloria on 11-8-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

#import "RootViewController.h"
#import "LanguageListController.h"


//pyanfield : Creating a class extension lets you define some methods and properties that are going to be used within your class but that you don’t want to expose to other classes in a header file.
@interface DetailViewController ()
// make use of the instance variable we decleared earlier
@property (nonatomic, retain) UIPopoverController *popoverController;
//will called when we need to  update the display
- (void)configureView;
@end

//**********************************************************************//

@implementation DetailViewController

@synthesize toolbar = _toolbar;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize popoverController = _myPopoverController;
@synthesize webView = _webView;
@synthesize languageButton,languageString,languagePopoverController;

//pyanfield 
//Why make that a function instead of a method? p365
static NSString * modifyUrlForLanguage(NSString *url,NSString *lang)
{
    if (!lang) {
        return url;
    }
    
    NSRange languageCodeRange = NSMakeRange(7, 2);
    if ([[url substringWithRange:languageCodeRange] isEqualToString:lang]) {
        return url;
    } else {
        NSString *newUrl = [url stringByReplacingCharactersInRange:languageCodeRange withString:lang];
        return newUrl;
    }
}

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        _detailItem = [modifyUrlForLanguage(newDetailItem, languageString) retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }       
    if (self.languagePopoverController != nil) {
        [self.languagePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    //pyanfield
    NSURL *url = [NSURL URLWithString:_detailItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

    self.detailDescriptionLabel.text = [self.detailItem description];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - Split view support


//pyanfield :  It’s called when the split view controller is no longer going to show the left side of the split view as a permanent fixture (that is, when the iPad is rotated to portrait orientation). 
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    //barButtonItem.title = @"Events";
    barButtonItem.title = @"Presidents";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
 */

- (void)viewDidUnload
{
	[super viewDidUnload];

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
    self.webView = nil;
    self.languageButton = nil;
    self.languagePopoverController = nil;
    
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];
    [_detailDescriptionLabel release];
    [_webView release];
    [languageButton release];
    [languagePopoverController release];
    [super dealloc];
}


- (void)setLanguageString:(NSString *)newString
{
    if (![newString isEqualToString:languageString]) {
        [languageString release];
        languageString = [newString copy];
        self.detailItem = modifyUrlForLanguage(_detailItem, languageString);
    }
}

- (IBAction)touchLanguageButton
{
    LanguageListController *languageListController = [[LanguageListController alloc] init];
    languageListController.detailViewController = self;
    UIPopoverController *poc = [[UIPopoverController alloc] initWithContentViewController:languageListController];
    [poc presentPopoverFromBarButtonItem:languageButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    self.languagePopoverController = poc;
    [poc release];
    [languageListController release];
}
@end
