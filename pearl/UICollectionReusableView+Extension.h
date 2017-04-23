//
//  UICollectionReusableView+Extension.h
//  luckynumber
//
//  Created by huangmin on 11/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionReusableView (Extension)
+(instancetype)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
                  atIndexPath:(NSIndexPath *)indexPath;
@end
