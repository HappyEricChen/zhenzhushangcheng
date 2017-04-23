//
//  TPMedia.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPMedia.h"

@implementation TPMedia
#pragma mark YYModel
/**
 * map -- key
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"url":@"url",
             @"width":@"width",
             @"height":@"height"};
}
/**
 * json -> model
 */
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic
{
    return _url != nil;
}
@end
