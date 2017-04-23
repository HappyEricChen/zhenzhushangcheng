//
//  TPPost.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPPost.h"
@implementation TPPost
#pragma mark YYModel
/**
 * map -- key
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"idNum":@"id",
             @"media":@"medias.normal",
             @"title":@"title",
             @"tags":@"tags"};
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
    if (_title)
    {
        CGFloat height = [_title boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width-40, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:UIFont.medium(14)} context:nil].size.height;
        height += (UIScreen.mainScreen.bounds.size.width-40)*2/3;
        height += 10 + 10;
        height += 17;
        height += 25;
        _estimatedHeight = height;
    }
    return _idNum != nil && _media != nil && _title != nil && _tags != nil;
}
@end
