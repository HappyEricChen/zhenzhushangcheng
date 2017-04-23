//
//  UIView+Extension.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
#pragma mark instance method
-(UIView*(^)(UIViewContentMode))mode
{
    return ^(UIViewContentMode contentMode)
    {
        self.contentMode = contentMode;
        return self;
    };
}
-(void)fadeAnimation
{
    UIImage* image = [self snapshotImageAfterScreenUpdates:NO];
    UIImageView* coverImageView = [[UIImageView alloc]initWithImage:image];
    coverImageView.clipsToBounds = YES;
    coverImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:coverImageView];
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.top.equalTo(@0);
    }];
    [UIView animateWithDuration:.5 animations:^{
        coverImageView.alpha = 0.f;
    }completion:^(BOOL finished) {
        if (finished)
        {
            [coverImageView removeFromSuperview];
        }
    }];
}
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
-(void)setContent:(id)content
{
}
-(UIView*(^)(CGFloat))bordthWidth
{
    return ^(CGFloat width)
    {
        if (isnan(width) == NO)
        {
            self.layer.borderWidth = width;
        }
        return self;
    };
}
-(UIView*(^)(id))bordthColor
{
    return ^(id obj)
    {
        if ([obj isKindOfClass:[UIColor class]])
        {
            self.layer.borderColor = [(UIColor*)obj CGColor];
        }
        else if ([obj isKindOfClass:[NSString class]])
        {
            UIColor* color = UIColor.hexColor(obj);
            if (color)
            {
                self.layer.borderColor = color.CGColor;
            }
        }
        return self;
    };
}
-(UIView*(^)(CGFloat))cornerRadius
{
    return ^(CGFloat radius)
    {
        if (isnan(radius) == NO)
        {
            self.layer.cornerRadius = radius;
        }
        return self;
    };
}
-(UIView*(^)(BOOL))masksToBounds
{
    return ^(BOOL clipped)
    {
        self.layer.masksToBounds = clipped;
        return self;
    };
}
#pragma mark class method
+(CGSize)contentSize
{
    return CGSizeZero;
}
@end
