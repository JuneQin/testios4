//
//  SectionsViewController.m
//  Sections
//
//  Created by guo gloria on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SectionsViewController.h"
#import "NSDictionary-MutableDeepCopy.h"

//pyanfield: the comments like "//>>"  is for "adding a magnifying glass to the index"


//pyanfield : in the SectionsViewController.xib file, you can change the style in the attributes inspector to Plain. and then switch to Grouped. to compare the different.

@implementation SectionsViewController
@synthesize names;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allNames;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    //self.names = dict;
    
    self.allNames = dict;
    [dict release];
    
    
    //pyanfield : get the dictionary keys A~Z
    //NSArray *array = [[names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    //self.keys = array;
    
    [self resetSearch];
    [table reloadData];
    [table setContentOffset:CGPointMake(0.0, 44.0) animated:NO];
    
    [super viewDidLoad];
}

- (void)dealloc
{
    [table release];
    [search release];
    [allNames release];
    
    [names release];
    [keys release];
    [super dealloc];
}
- (void)viewDidUnload
{
    self.table = nil;
    self.search = nil;
    self.allNames = nil;
    
    self.names = nil;
    self.keys = nil;
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


//pyanfield: return the number of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [keys count];
    return ([keys count]>0)?[keys count]:1;
}

//pyanfield : get the number of rows in the specific section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //pyanfield : for search bar
    if ([keys count] == 0) {
        return 0;
    }
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}

//pyanfield : In our tableView:cellForRowAtIndexPath: method, we need to extract both the section and row from the index path, and use those to determine which value to use. 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    
    static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SectionsTableIdentifier] autorelease];
        
    }
    
    cell.textLabel.text = [nameSection objectAtIndex:row];
    return cell;
}

//pyanfield: to specify an optional header value for each section and simple return the letter for this group
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //pyanfield: code for search bar
    if ([keys count] == 0) {
        return nil;
    }
    
    NSString *key = [keys objectAtIndex:section];
    
    //>>
    if(key == UITableViewIndexSearch)
        return nil;
    
    return key;
}
// pyanfield: add an index down the right side of the table view.
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if(isSearching)
        return nil;
    return keys;
}


//below code for search bar
#pragma mark -
#pragma mark Custom Methods
//pyanfield: will call below method when the search cancelled or change the search term.
- (void)resetSearch
{
    NSMutableDictionary *allNamesCopy = [self.allNames mutableDeepcopy];
    self.names = allNamesCopy;
    [allNamesCopy release];
    
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    
    //>>
    [keyArray addObject:UITableViewIndexSearch];
    
    [keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
    [keyArray release];
}

- (void)handleSearchForTerm:(NSString *)searchTerm
{
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    for (NSString *key in self.keys) {
        NSMutableArray *array = [names valueForKey:key];
        NSMutableArray *toRemove = [[NSMutableArray alloc] init];
        for(NSString *name in array)
        {
            if ([name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound) {
                [toRemove addObject:name];
            }
        }
        
        if ([array count] == [toRemove count]) {
            [sectionsToRemove addObject:key];
        }
        
        [array removeObjectsInArray:toRemove];
        [toRemove release];
    }
    
    [self.keys removeObjectsInArray:sectionsToRemove];
    [sectionsToRemove release];
    [table reloadData];
}

#pragma mark - 
#pragma mark Table View Delegate Methods

//pyanfield: if the user clicks a row while using the search bar, want the keyboard to go away.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [search resignFirstResponder];
    
    //pyanfield : for clicking the search button, the index disappeared
    isSearching = NO;
    search.text = @"";
    [tableView reloadData];
    
    
    return indexPath;
}
//>>
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSString *key = [keys objectAtIndex:index];
    if (key == UITableViewIndexSearch) {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }else
        return index;
}

#pragma mark -
#pragma mark Search Bar Delegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText length] == 0)
    {
        [self resetSearch];
        [table reloadData];
        return;
    }
    [self handleSearchForTerm:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    isSearching = NO;
    search.text = @"";
    [self resetSearch];
    [table reloadData];
    [searchBar resignFirstResponder];
}

//pyanfield: if click search, the index disappeared.
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    isSearching = YES;
    [table reloadData];
}






@end
