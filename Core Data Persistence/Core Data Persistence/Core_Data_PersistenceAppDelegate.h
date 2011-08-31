//
//  Core_Data_PersistenceAppDelegate.h
//  Core Data Persistence
//
//  Created by guo gloria on 11-8-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceViewController;

@interface Core_Data_PersistenceAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//pyanfield
@property (nonatomic, retain) IBOutlet PersistenceViewController *rootController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
