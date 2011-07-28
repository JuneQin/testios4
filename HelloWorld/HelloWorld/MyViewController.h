//
//  MyViewController.h
//  HelloWorld
//
//  Created by guo gloria on 11-7-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewController : UIViewController {


    NSString *userName;
    UITextField *textField;
    
    UILabel *label;
}

@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic,retain) NSString *userName;
@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction)chengeGreeting:(id)sender;


@end
