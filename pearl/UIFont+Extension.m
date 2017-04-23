//
//  UIFont+Extension.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "UIFont+Extension.h"
// "PingFangSC-Ultralight",
// "PingFangSC-Regular",
// "PingFangSC-Semibold",
// "PingFangSC-Thin",
// "PingFangSC-Light",
// "PingFangSC-Medium"
@implementation UIFont (Extension)
+(UIFont*(^)(CGFloat))regular
{
    return ^(CGFloat fontSize)
    {
        return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
    };
}
+(UIFont*(^)(CGFloat))bold
{
    return ^(CGFloat fontSize)
    {
        return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
    };
}
+(UIFont*(^)(CGFloat))medium
{
    return ^(CGFloat fontSize)
    {
        return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
    };
}
@end
