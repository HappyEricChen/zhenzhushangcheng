//
//  TPIndexTab.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPIndexTab.h"

@implementation TPIndexTab
#pragma mark YYModel
/**
 * map -- key
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"idNum":@"id",
             @"media":@"medias.normal",
             @"name":@"name"};
}
/**
 * map -- class
 */
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"media":TPMedia.class};
}
/**
 * json -> model
 */
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic
{
    return _idNum != nil && _media != nil && _name != nil;
}
@end
