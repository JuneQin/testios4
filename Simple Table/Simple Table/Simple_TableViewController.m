//
//  Simple_TableViewController.m
//  Simple Table
//
//  Created by guo gloria on 11-7-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Simple_TableViewController.h"

@implementation Simple_TableViewController
@synthesize listData;

- (void)dealloc
{
    [listData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy",@"Sneezy",@"Bashful",@"Happy",@"Doc",@"Grumy",@"Liverpool",@"Oril",@"Glen",@"Downing",@"Kenny",@"Steven",@"Lucas",@"Hendosen",@"Adam",@"Arsenal",@"Chease",@"Terry", nil];
    self.listData = array;
    [array release];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    self.listData = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //pyanfield : using for mutiple  data to indentify the different data
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    //pyanfield : using the different style ,you can try UITableViewCellStyleDefault|UITableViewCellStyleSubtitle|UITableViewCellStyleValue1|UITableViewCellStyleValue2
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
    
    //pyanfield : add the image to the cell
    UIImage *image = [UIImage imageNamed:@"star.png"];
    cell.imageView.image = image;
    //pyanfield : when you select the cell , the "star2.png" file will be drawn.
    UIImage *himage = [UIImage imageNamed:@"star2.png"];
    cell.imageView.highlightedImage = himage;
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    //pyanfield: set cell font size
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    
    //pyanfield : show the cell's detail text label
    if (row<7) {
        cell.detailTextLabel.text = @"detail text row<7";
    }else
    {
        cell.detailTextLabel.text = @">>>>====7";
    }
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
//pyanfield : This method sets te indent level for each row to its row number.
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    return row;
}
//pyanfield : below method will specify that the first row is not selectable.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    if (row == 0) {
        return nil;
    }
    return indexPath;
}
//pyanfield : metod for row selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowValue = [listData objectAtIndex:row];
    
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@",rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes,I did." otherButtonTitles: nil];
    
    [alert show];
    [message release];
    [alert release];
    
    // when you have pressed cancel button on alert.then don't select the row which you have pressed before. 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
// set the table's height in the table view's rows
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
