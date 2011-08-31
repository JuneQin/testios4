//
//  President.h
//  Nav
//
//  Created by guo gloria on 11-8-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//pyanfield : this file is for creating a custom object-c data object to hold the individual instances that will be displayed in the list

#define kPresidentNumberKey            @"President"
#define kPresidentNameKey              @"Name"
#define kPresidentFromKey              @"FromYear"
#define kPresidentToKey                @"ToYear"
#define kPresidentPartyKey             @"Party"

@interface President : NSObject <NSCoding> {
    int         number;
    NSString    *name;
    NSString    *fromYear;
    NSString    *toYear;
    NSString    *party;
}
@property int number;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fromYear;
@property (nonatomic, copy) NSString *toYear;
@property (nonatomic, copy) NSString *party;

@end
