//
//  UICollectionReusableView+Extension.m
//  luckynumber
//
//  Created by huangmin on 11/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import "UICollectionReusableView+Extension.h"

@implementation UICollectionReusableView (Extension)
+(instancetype)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
                  atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:NSStringFromClass(self)
                                                                               forIndexPath:indexPath];
    return view;
}
@end
