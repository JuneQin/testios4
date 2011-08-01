//
//  DisclosureDetailController.h
//  Nav
//
//  Created by guo gloria on 11-8-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisclosureDetailController : UIViewController
{
    UILabel *label;
    NSString *message;
    
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, copy) NSString *message;

@end
