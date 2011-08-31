//
//  FourLines.h
//  PersistenceArchiving
//
//  Created by guo gloria on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourLines : NSObject <NSCoding,NSCopying>
{
    NSString *field1;
    NSString *field2;
    NSString *field3;
    NSString *field4;
}
@property (nonatomic,retain) NSString *field1;
@property (nonatomic,retain) NSString *field2;
@property (nonatomic,retain) NSString *field3;
@property (nonatomic,retain) NSString *field4;

@end
