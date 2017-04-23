//
//  TPIndexTab.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPMedia.h"
@interface TPIndexTab : NSObject
@property (strong, nonatomic) NSNumber* idNum;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) TPMedia* media;
@end
