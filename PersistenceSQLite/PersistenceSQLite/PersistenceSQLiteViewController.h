//
//  PersistenceSQLiteViewController.h
//  PersistenceSQLite
//
//  Created by guo gloria on 11-8-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilename @"data.sqlite3"

@interface PersistenceSQLiteViewController : UIViewController {
    UITextField *field1;
    UITextField *field2;
    UITextField *field3;
    UITextField *field4;
}

@property (nonatomic, retain) IBOutlet UITextField *field1;
@property (nonatomic, retain) IBOutlet UITextField *field2;
@property (nonatomic, retain) IBOutlet UITextField *field3;
@property (nonatomic, retain) IBOutlet UITextField *field4;

- (NSString *)dataFilePath;
- (void)applicationWillResignActive:(NSNotification *)notification;

@end
