//
//  UIFont+Extension.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
+(UIFont*(^)(CGFloat))regular;
+(UIFont*(^)(CGFloat))bold;
+(UIFont*(^)(CGFloat))medium;
@end
