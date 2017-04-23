//
//  UICollectionView+Extension.h
//  luckynumber
//
//  Created by huangmin on 10/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Extension)
/**
 * register reuse cell classes
 */
-(UICollectionView*(^)(NSArray*))registerClasses;
/**
 * register reuse cell nib
 */
-(UICollectionView*(^)(NSArray*))registerNibs;
/**
 * register reuse section header/footer class
 */
-(UICollectionView*(^)(Class, NSString* ))registerHeaderFooterClass;
/**
 * register reuse section header/footer nib
 */
-(UICollectionView*(^)(Class, NSString*))registerHeaderFooterNib;
/**
 * content inset
 */
-(UICollectionView*(^)(UIEdgeInsets))insets;
/**
 * configure delegate
 */
-(UICollectionView*(^)(id))configureDelegate;
/**
 * configure dataSource
 */
-(UICollectionView*(^)(id))configureDataSource;
@end
