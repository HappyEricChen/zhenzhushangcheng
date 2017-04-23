//
//  UICollectionViewCell+Extension.h
//  luckynumber
//
//  Created by huangmin on 10/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Extension)
/**
 * collection view factory initialization
 */
+(instancetype)collectionView:(UICollectionView*)collectionView
                    indexPath:(NSIndexPath*)indexPath;
@end
