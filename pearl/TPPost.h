//
//  TPPost.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPMedia.h"
@interface TPPost : NSObject
@property (strong, nonatomic) NSNumber* idNum;
@property (strong, nonatomic) TPMedia* media;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSArray<NSString*>* tags;

@property (assign, nonatomic, readonly) CGFloat estimatedHeight;
@end
