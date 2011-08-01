//
//  FirstLevelViewController.m
//  Nav
//
//  Created by guo gloria on 11-8-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelViewController.h"

@implementation FirstLevelViewController
@synthesize controllers;



//- (id)init
//{
//    self = [super init];
//    if (self) {
//        // Initialization code here.
//    }
//    
//    return self;
//}
//
//

- (void)viewDidLoad
{
    self.title = @"First Level";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    self.controllers = array;
    [array release];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.controllers = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    [controllers release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FirstLevelCell = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelCell];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstLevelCell] autorelease];
    }
    
    NSUInteger row = [indexPath row];
    SecondLevelViewController *controller = [controllers objectAtIndex:row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    SecondLevelViewController *nextController = [self.controllers objectAtIndex:row];
    
    
    //pyanfield : navigationController is the instance of Navigation componennt in .mib file
    [self.navigationController pushViewController:nextController animated:YES];
}












@end
