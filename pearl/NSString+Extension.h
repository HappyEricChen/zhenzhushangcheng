//
//  NSString+Extension.h
//  luckynumber
//
//  Created by huangmin on 07/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 * URL encodeed string
 */
-(NSString *)URLEncodedString;
/**
 * ten -> sixteen
 */
+(NSString *)ToHex:(uint16_t)tmpid;
@end
