//
//  UIImage+Extension.m
//  pearl
//
//  Created by huangmin on 22/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(instancetype(^)(NSString*))imageName
{
    return ^(NSString* name)
    {
        return [UIImage imageNamed:name];
    };
}
+ (instancetype)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
