//
//  NSDictionary-MutableDeepCopy.m
//  Sections
//
//  Created by guo gloria on 11-7-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary-MutableDeepCopy.h"

@implementation NSDictionary(MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepcopy
{
    //pyanfield : self is a reference to the dictionary that this method is being called on.
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    
    NSArray *keys = [self allKeys];
    
    for(id key in keys)
    {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        
        if ([oneValue respondsToSelector:@selector(mutableDeepcopy)]) {
            oneCopy = [oneValue mutableDeepcopy];
        } else if ([oneValue respondsToSelector:@selector(mutableCopy)]){
            oneCopy = [oneValue mutableCopy];
        }
        
        if (oneCopy == nil) {
            oneCopy = [oneValue copy];
        }
        [returnDict setValue:oneCopy forKey:key];
        [oneCopy release];
    }
    
    
    return returnDict;
}

@end
