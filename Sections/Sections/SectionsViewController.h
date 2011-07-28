//
//  SectionsViewController.h
//  Sections
//
//  Created by guo gloria on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController
    <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    //NSDictionary *names;
    //NSArray *keys;
    
    //below code for search bar section
    UITableView *table;
    UISearchBar *search;
    NSDictionary *allNames;
    NSMutableDictionary *names;
    NSMutableArray *keys;
    
    //pyanfield: for clicking the search button, index disappeared.
    BOOL isSearching;
}

//@property (nonatomic, retain) NSDictionary *names;
//@property (nonatomic, retain) NSArray *keys;

@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) IBOutlet UISearchBar *search;
@property (nonatomic, retain) NSDictionary *allNames;
@property (nonatomic, retain) NSMutableArray *keys;
@property (nonatomic, retain) NSMutableDictionary *names;

- (void)resetSearch;
- (void)handleSearchForTerm:(NSString *)searchTerm;

@end
