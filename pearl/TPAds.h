//
//  TPAds.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPMedia.h"
@interface TPAds : NSObject
@property (strong, nonatomic) NSNumber* idNum;
@property (strong, nonatomic) TPMedia* media;
#warning todo 这个点击事件的url需要配置
@property (strong, nonatomic) NSString* clickUrl;
@end
