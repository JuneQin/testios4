//
//  RootViewController.h
//  Presidents
//
//  Created by guo gloria on 11-8-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) NSArray *presidents;

@end
