//
//  CellsViewController.h
//  Cells
//
//  Created by guo gloria on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag 1
#define kColorValueTag 2

@interface CellsViewController : UIViewController
    <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *computers;
    UITableViewCell *tvCell;
}

@property (nonatomic, retain) NSArray *computers;

//pyanfield: below code for customize xib file for Cell
@property (nonatomic, retain) IBOutlet UITableViewCell *tvCell;

@end
