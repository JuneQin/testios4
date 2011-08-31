//
//  DetailViewController.h
//  Presidents
//
//  Created by guo gloria on 11-8-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;

@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

//pyanfield
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *languageButton;
@property (nonatomic, retain) UIPopoverController *languagePopoverController;
@property (nonatomic, copy) NSString *languageString;

- (IBAction)touchLanguageButton;

@end
