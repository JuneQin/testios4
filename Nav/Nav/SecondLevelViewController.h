//
//  SecondLevelViewController.h
//  Nav
//
//  Created by guo gloria on 11-8-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//pyanfield : for displaying an icon to left of each of its subcontroller names.
@interface SecondLevelViewController : UITableViewController
{
    UIImage *rowImage;
}

@property (nonatomic,retain) UIImage *rowImage;
@end
