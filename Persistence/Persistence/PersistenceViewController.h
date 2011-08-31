//
//  PersistenceViewController.h
//  Persistence
//
//  Created by guo gloria on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilename @"data.plist"
@interface PersistenceViewController : UIViewController {
    UITextField *field1;
    UITextField *field2;
    UITextField *field3;
    UITextField *field4;
}

@property (nonatomic, retain) IBOutlet UITextField *field1;
@property (nonatomic, retain) IBOutlet UITextField *field2;
@property (nonatomic, retain) IBOutlet UITextField *field3;
@property (nonatomic, retain) IBOutlet UITextField *field4;

//pyanfield: create and return the full pathname to our data file by concatenating kFilename onto the path for the Documents directory
- (NSString *)dataFilePath;
//pyanfield: will be called when the app quits and will save data to the plist file.
- (void)applicationWillResignActive:(NSNotification *)notification;

@end
