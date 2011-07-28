//
//  SwapViewController.h
//  Swap
//
//  Created by guo gloria on 11-7-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define degreesToRadians(x) (M_PI*(x)/180.0)

@interface SwapViewController : UIViewController {
    
    UIView *landscape;
    UIView *portrait;
    UIButton *portraitFooButton;
    UIButton *portraitBarButton;
    UIButton *landscapeFooButton;
    UIButton *landscapeBarButton;

}
@property (nonatomic, retain) IBOutlet UIView *landscape;
@property (nonatomic, retain) IBOutlet UIView *portrait;
@property (nonatomic, retain) IBOutlet UIButton *portraitFooButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitBarButton;
@property (nonatomic, retain) IBOutlet UIButton *landscapeFooButton;
@property (nonatomic, retain) IBOutlet UIButton *landscapeBarButton;

- (IBAction)buttonPressed:(id)sender;
@end
