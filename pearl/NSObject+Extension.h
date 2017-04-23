//
//  NSObject+Extension.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
-(id)jsonForKey:(NSString*)aKey;
-(id)safe_numberForKey:(NSString *)aKey;
-(id)safe_stringForKey:(NSString *)aKey;
@end
