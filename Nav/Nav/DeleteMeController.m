//
//  DeleteMeController.m
//  Nav
//
//  Created by guo gloria on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeleteMeController.h"

@implementation DeleteMeController

@synthesize list;

- (IBAction)toggleEdit:(id)sender
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if(self.tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else
        [self.navigationItem.rightBarButtonItem setTitle:@"Delete"];
}

- (void)viewDidLoad
{
    if (list == nil) {
        
        //pyanfield : load the "computer.plist" file and parse it to mutablearray
        NSString *path = [[NSBundle mainBundle] pathForResource:@"computers" ofType:@"plist"];
        NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
        
        self.list = array;
        [array release];
    }
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Delete" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleEdit:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    [editButton release];
    
    [super viewDidLoad];
}

- (void)dealloc {
    [list release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *DeleteMeCellIdentifier = @"DeleteMeCellIdentifier";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             DeleteMeCellIdentifier];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:DeleteMeCellIdentifier] autorelease];
    }
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    return cell;
}

//pyanfield: the delete style is the default UITableViewCellEditingStyle. so we can ignore this method below. if you remove the comment, using the UITableViewCellStyleNone to try to build , the delete method is not available
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleNone;
//}

#pragma mark -
#pragma mark Table View Data Source Methods

// pyanfiel : below is the main different with MoveMeController.m
// this will be called when the cell has made an edit
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    NSUInteger row = [indexPath row];
    [self.list removeObjectAtIndex:row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
}

@end
