//
//  NSMutableArray+Extension.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)
-(NSMutableArray*(^)(id))appendObj
{
    return ^(id obj)
    {
        if (obj != nil && [obj isEqual:[NSNull null]] == NO)
        {
            [self addObject:obj];
        }
        return self;
    };
}
-(NSMutableArray*(^)(NSArray*))appendObjs
{
    return ^(NSArray* objs)
    {
        if ([objs isKindOfClass:NSArray.class])
        {
            [self addObjectsFromArray:objs];
        }
        return self;
    };
}
@end
