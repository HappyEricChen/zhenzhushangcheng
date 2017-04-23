//
//  TPProduct.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPProduct.h"

@implementation TPProduct
#pragma mark YYModel
/**
 * map -- key
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"idNum":@"id",
             @"media":@"medias.normal",
             @"title":@"title",
             @"currency":@"currency",
             @"salePrice":@"sale_price",
             @"listPrice":@"list_price"};
}
/**
 * map -- class
 */
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"media":TPMedia.class};
}
@end
