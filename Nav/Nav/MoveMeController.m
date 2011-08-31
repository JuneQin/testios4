//
//  MoveMeController.m
//  Nav
//
//  Created by guo gloria on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MoveMeController.h"

@implementation MoveMeController

@synthesize list;

- (void)viewDidLoad {
    if (list == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
								 @"Eeny", @"Meeny", @"Miney", @"Moe", @"Catch", @"A",
								 @"Tiger", @"By", @"The", @"Toe", nil];
        self.list = array;
        [array release];
    }
	
    //pyanfield : create a button bar item on the navigation bar.
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Move"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(toggleMove)];
    
    self.navigationItem.rightBarButtonItem = moveButton;
    [moveButton release];
    [super viewDidLoad];
}
- (IBAction)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if(self.tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else    
        [self.navigationItem.rightBarButtonItem setTitle:@"Move"];
    
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
	
    static NSString *MoveMeCellIdentifier = @"MoveMeCellIdentifier";
    UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:MoveMeCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:MoveMeCellIdentifier] autorelease];
        //pyanfield:Standard accessory icons can be specified by setting the accessoryType property of the cell. But the reorder control is not a standard accessory icon. It’s a special case that’s shown only when the table is in edit mode. To enable the reorder control, we need to set a property on the cell itself.
        cell.showsReorderControl = YES;
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [list objectAtIndex:row];
	
    return cell;
}

//pyanfield: this method allows the table view to ask if a specific row can be deleted or if a new row can be inserted at a specific spot.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // do not need to delete and insert
    return UITableViewCellEditingStyleNone;
}

//pyanfield : This method is called for each row, and it gives you the chance to disallow the movement of specific rows. 
- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //do not allow to move the row 1
    NSUInteger row = [indexPath row];
    if (row == 1) {
        return NO;
    }
    
    return YES;
}

//pyanfield : move cell from "fromRow" to "toRow"
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger fromRow = [fromIndexPath row];
    NSUInteger toRow = [toIndexPath row];
	
    id object = [[list objectAtIndex:fromRow] retain];
    [list removeObjectAtIndex:fromRow];
    [list insertObject:object atIndex:toRow];
    [object release];
}

@end
