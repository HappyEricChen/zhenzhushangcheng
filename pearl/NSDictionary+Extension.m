//
//  NSDictionary+Extension.m
//  luckynumber
//
//  Created by huangmin on 07/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)
#pragma mark override -- super class method
-(id)safe_numberForKey:(NSString *)aKey
{
    if (isStr(aKey))
    {
        id obj = [self objectForKey:aKey];
        if (isNum(obj))
        {
            return obj;
        }
    }
    return nil;
}
-(id)safe_stringForKey:(NSString *)aKey
{
    if (isStr(aKey))
    {
        id obj = [self objectForKey:aKey];
        if (isStr(obj))
        {
            return obj;
        }
    }
    return nil;
}
-(id)jsonForKey:(NSString*)aKey
{
    if (isStr(aKey))
    {
        id obj = [self objectForKey:aKey];
        if ([NSJSONSerialization isValidJSONObject:obj])
        {
            return obj;
        }
    }
    return nil;
}
@end
