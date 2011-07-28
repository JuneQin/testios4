//
//  Simple_TableViewController.h
//  Simple Table
//
//  Created by guo gloria on 11-7-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Simple_TableViewController : UIViewController
    <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *listData;
}
@property (nonatomic, retain) NSArray *listData;
@end
