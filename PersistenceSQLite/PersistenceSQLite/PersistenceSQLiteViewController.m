//
//  PersistenceSQLiteViewController.m
//  PersistenceSQLite
//
//  Created by guo gloria on 11-8-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PersistenceSQLiteViewController.h"
#import <sqlite3.h>

@implementation PersistenceSQLiteViewController
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    return [docDirectory stringByAppendingPathComponent:kFilename];
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //pyafield : for sqlite3
    sqlite3 *database;
    
    //begin to open the database, if hit a problem , close it and raise an assertion
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open databse");
    }
    
    char *errorMsg;
    //check the if the table is exist,if not , create a new one
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    if (sqlite3_exec (database, [createSQL UTF8String],
					  NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error creating table: %s", errorMsg);
    }
    
    //load the data
    NSString *query = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String],
						   -1, &statement, nil) == SQLITE_OK) {
		//step through each of the returned rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
			int row = sqlite3_column_int(statement, 0);
			char *rowData = (char *)sqlite3_column_text(statement, 1);
			
			NSString *fieldName = [[NSString alloc]
								   initWithFormat:@"field%d", row];
			NSString *fieldValue = [[NSString alloc]
									initWithUTF8String:rowData];
			UITextField *field = [self valueForKey:fieldName];
			field.text = fieldValue;
			[fieldName release];
			[fieldValue release];
		}
		sqlite3_finalize(statement);
    }
    sqlite3_close(database);
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationWillResignActive:)
												 name:UIApplicationWillResignActiveNotification
											   object:app];
    
    [super viewDidLoad];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) !=SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0,@"Failed to open database");
    }
    
    for (int i=1; i<=4; i++) {
        NSString *fieldName = [[NSString alloc] initWithFormat:@"field%d",i];
        UITextField *field = [self valueForKey:fieldName];
        [fieldName release];
        
        char *errorMsg;
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW,FIELD_DATA) VALUES (?,?);";
        
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [field.text UTF8String], -1, NULL);
        }
        
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSAssert1(0, @"Error updating table: %s", errorMsg);
        }
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
    
}


- (void)viewDidUnload
{
    [self setField1:nil];
    [self setField2:nil];
    [self setField3:nil];
    [self setField4:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [field1 release];
    [field2 release];
    [field3 release];
    [field4 release];
    [super dealloc];
}
@end
