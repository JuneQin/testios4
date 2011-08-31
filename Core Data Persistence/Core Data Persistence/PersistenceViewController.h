//
//  PersistenceViewController.h
//  Core Data Persistence
//
//  Created by guo gloria on 11-8-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersistenceViewController : UIViewController {
    UITextField *line1;
    UITextField *line2;
    UITextField *line3;
    UITextField *line4;
}

@property (nonatomic, retain) IBOutlet UITextField *line1;
@property (nonatomic, retain) IBOutlet UITextField *line2;
@property (nonatomic, retain) IBOutlet UITextField *line3;
@property (nonatomic, retain) IBOutlet UITextField *line4;

@end
