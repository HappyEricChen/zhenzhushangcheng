//
//  UICollectionViewCell+Extension.m
//  luckynumber
//
//  Created by huangmin on 10/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import "UICollectionViewCell+Extension.h"

@implementation UICollectionViewCell (Extension)
+(instancetype)collectionView:(UICollectionView*)collectionView
                    indexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self)
                                                                           forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[[self class]alloc]initWithFrame:CGRectZero];
    }
    return cell;
}
@end
