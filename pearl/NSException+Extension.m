//
//  NSException+Extension.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "NSException+Extension.h"

@implementation NSException (Extension)
+(instancetype)dataSourceException
{
    return [NSException exceptionWithName:@"dataSource error"
                                   reason:@"out of control"
                                 userInfo:nil];
}
@end
