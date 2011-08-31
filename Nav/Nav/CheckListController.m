//
//  CheckListController.m
//  Nav
//
//  Created by guo gloria on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CheckListController.h"

@implementation CheckListController

@synthesize list;
@synthesize lastIndexPath;


- (void)viewDidLoad {
	
    NSArray *array = [[NSArray alloc] initWithObjects:@"Who Hash",
					  @"Bubba Gump Shrimp Étouffée", @"Who Pudding", @"Scooby Snacks",
					  @"Everlasting Gobstopper", @"Green Eggs and Ham", @"Soylent Green",
					  @"Hard Tack", @"Lembas Bread", @"Roast Beast", @"Blancmange", nil];
    self.list = array;
    [array release];
	
    [super viewDidLoad];
}

- (void)viewDidUnload {
    self.list = nil;
    self.lastIndexPath = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    [list release];
    [lastIndexPath release];
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
    static NSString *CheckMarkCellIdentifier = @"CheckMarkCellIdentifier";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
							 CheckMarkCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:CheckMarkCellIdentifier] autorelease];
    }
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [lastIndexPath row];
    cell.textLabel.text = [list objectAtIndex:row];
    
    //pyanfield : if the table is requesting a cell for a row that is the currently selected row, we set the accessory icon to be a check mark; otherwise, we set it to be nothing. Notice that we also check lastIndexPath to make sure it’s not nil. We do this because a nil lastIndexPath indicates no selection.
    cell.accessoryType = (row == oldRow && lastIndexPath != nil) ?
    UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    //pyanfield : the newRow that we just selected, and the oldRow was the row previously selected.
    int newRow = [indexPath row];
    int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
	
    //pyanfield : if not the same row with previous , assign a check mark as the current row's accessory icon.
    if (newRow != oldRow) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:
                                    indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:
                                    lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }else
    {
        //pyanfield : added by pyanfield. if press the same row twice, the accesstory icon different.
        UITableViewCell *nowCell = [tableView cellForRowAtIndexPath:indexPath];
        nowCell.accessoryType = UITableViewCellAccessoryNone;
        oldRow = -1;
        lastIndexPath = nil;
    }
    
    //pyanfield : because the check mark has assigned. so don't need the row to stay highlighted.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
