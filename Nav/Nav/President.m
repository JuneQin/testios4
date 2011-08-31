//
//  President.m
//  Nav
//
//  Created by guo gloria on 11-8-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "President.h"

@implementation President

@synthesize number;
@synthesize name;
@synthesize fromYear;
@synthesize toYear;
@synthesize party;

- (void)dealloc{
    [name release];
    [fromYear release];
    [toYear release];
    [party release];
    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding

// pyanfield : encodes our object to be saved
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.number forKey:kPresidentNumberKey];
    [aCoder encodeObject:self.name forKey:kPresidentNameKey];
    [aCoder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [aCoder encodeObject:self.toYear forKey:kPresidentToKey];
    [aCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

// pyanfield : used to create new objects from the saved file
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        number = [aDecoder decodeIntForKey:kPresidentNumberKey];
        name = [aDecoder decodeObjectForKey:kPresidentNameKey];
        fromYear = [aDecoder decodeObjectForKey:kPresidentFromKey];
        toYear = [aDecoder decodeObjectForKey:kPresidentToKey];
        party = [aDecoder decodeObjectForKey:kPresidentPartyKey];
    }
    return self;
}

@end
