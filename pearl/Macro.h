//
//  Macro.h
//  luckynumber
//
//  Created by huangmin on 07/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define isStr(_str) [_str isKindOfClass:[NSString class]]
#define isNum(_num) [_num isKindOfClass:[NSNumber class]]
#define isNonNull(_obj) (_obj != nil && _obj != [NSNull null])
#define isArr(_arr) [_arr isKindOfClass:[NSArray class]]
#define isDic(_dic) [_dic isKindOfClass:[NSDictionary class]]
#endif /* Macro_h */
