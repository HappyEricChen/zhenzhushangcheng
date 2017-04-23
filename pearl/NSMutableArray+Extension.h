//
//  NSMutableArray+Extension.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extension)
// 增加元素
-(NSMutableArray*(^)(id))appendObj;
// 增加一组元素
-(NSMutableArray*(^)(NSArray*))appendObjs;
@end
