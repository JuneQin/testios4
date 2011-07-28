//
//  NSDictionary-MutableDeepCopy.h
//  Sections
//
//  Created by guo gloria on 11-7-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//pyanfield: can use this class in other project if you need mutableDeepcopy method.
@interface NSDictionary(MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepcopy;
@end
