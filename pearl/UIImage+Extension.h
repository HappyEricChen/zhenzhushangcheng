//
//  UIImage+Extension.h
//  pearl
//
//  Created by huangmin on 22/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
// 图片初始化方法
+(instancetype(^)(NSString*))imageName;
// 生成颜色的图片
+(instancetype)imageWithColor:(UIColor *)color;
@end
