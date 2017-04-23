//
//  UIView+Extension.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
#pragma mark 实例方法
// 设置视图 contentMode属性
-(UIView*(^)(UIViewContentMode))mode;
// 渐隐动画
-(void)fadeAnimation;
// 配置参数
-(void)setContent:(id)content;
// 设置layer边线宽度
-(UIView*(^)(CGFloat))bordthWidth;
// 设置layer边线颜色
-(UIView*(^)(id))bordthColor;
// 设置layer圆角半径
-(UIView*(^)(CGFloat))cornerRadius;
// 设置layer遮罩
-(UIView*(^)(BOOL))masksToBounds;
#pragma mark 类方法
// 视图的尺寸
+(CGSize)contentSize;
@end
