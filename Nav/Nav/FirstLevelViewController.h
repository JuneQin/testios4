//
//  FirstLevelViewController.h
//  Nav
//
//  Created by guo gloria on 11-8-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstLevelViewController : UITableViewController{
    NSArray *controllers;
}


//pyanfield : hold the instances of the second-level view controller. using it to feed data to our table.
@property (nonatomic, retain) NSArray *controllers;
@end
