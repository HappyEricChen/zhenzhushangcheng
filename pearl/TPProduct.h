//
//  TPProduct.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPMedia.h"
@interface TPProduct : NSObject
@property (strong, nonatomic) NSNumber* idNum;
@property (strong, nonatomic) TPMedia* media;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* currency;
@property (strong, nonatomic) NSNumber* salePrice;
@property (strong, nonatomic) NSNumber* listPrice;
@end
