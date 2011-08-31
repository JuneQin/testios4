//
//  LanguageListController.h
//  Presidents
//
//  Created by guo gloria on 11-8-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface LanguageListController : UITableViewController

// pyanfield : not retain, is assign for detailViewController. DetailViewController retain LanguageListController, but LanguangeListController not specifically retain DetailViewController.
@property (nonatomic, assign) DetailViewController *detailViewController;

@property (nonatomic, retain) NSArray *languageNames;
@property (nonatomic, retain) NSArray *languageCodes;

@end
