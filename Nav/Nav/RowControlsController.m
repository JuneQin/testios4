//
//  RowControlsController.m
//  Nav
//
//  Created by guo gloria on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RowControlsController.h"

@implementation RowControlsController
@synthesize list;

- (IBAction)buttonTapped:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    //pyanfield : we get the button’s superview, which is the table view cell for the row it’s in, and we use that to determine the row that was pressed and to retrieve the title for that row.
    UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
    NSUInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
    NSString *buttonTitle = [list objectAtIndex:buttonRow];
    
    UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"You tapped the button"
						  message:[NSString stringWithFormat:
								   @"You tapped the button for %@", buttonTitle]
						  delegate:nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
    [alert show];
    [alert release];
    
}

- (void)viewDidLoad {
    NSArray *array = [[NSArray alloc] initWithObjects:@"R2-D2",
					  @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab",
					  @"Bender", @"Marvin", @"Lt. Commander Data",
					  @"Evil Brother Lore", @"Optimus Prime", @"Tobor", @"HAL",
					  @"Orgasmatron", nil];
    self.list = array;
    [array release];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    self.list = nil;
    [super viewDidUnload];
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
    static NSString *ControlRowIdentifier = @"ControlRowIdentifier";
	
    UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:ControlRowIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:ControlRowIdentifier] autorelease];
        UIImage *buttonUpImage = [UIImage imageNamed:@"button_up.png"];
        UIImage *buttonDownImage = [UIImage imageNamed:@"button_down.png"];
        
        //pyanfield : customize the button .Because the buttonType property of UIButton is declared read-only, we need to create the button using the factory method buttonWithType:. If we created it using alloc and init, we wouldn’t be able to change the button’s type to UIButtonTypeCustom, which we need to do in order to use the custom button images.
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0, 0.0, buttonUpImage.size.width,
								  buttonUpImage.size.height);
        [button setBackgroundImage:buttonUpImage
						  forState:UIControlStateNormal];
        [button setBackgroundImage:buttonDownImage
						  forState:UIControlStateHighlighted];
        [button setTitle:@"Tap" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:)
		 forControlEvents:UIControlEventTouchUpInside];
        
        cell.accessoryView = button;
    }
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    cell.textLabel.text = rowTitle;
	
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"You tapped the row."
						  message:[NSString
								   stringWithFormat:@"You tapped %@.", rowTitle]
						  delegate:nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
    [alert show];
    [alert release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
