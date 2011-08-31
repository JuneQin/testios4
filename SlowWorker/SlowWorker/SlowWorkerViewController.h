//
//  SlowWorkerViewController.h
//  SlowWorker
//
//  Created by guo gloria on 11-8-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlowWorkerViewController : UIViewController {
    UIButton *startButton;
    UITextView *resultsTextView;
    UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UITextView *resultsTextView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;

- (IBAction)doWork:(id)sender;

@end
