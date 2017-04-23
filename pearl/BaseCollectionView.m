//
//  BaseCollectionView.m
//  luckynumber
//
//  Created by huangmin on 10/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    return [self initWithFrame:CGRectZero
          collectionViewLayout:layout];
}
-(instancetype)initWithFrame:(CGRect)frame
        collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}
@end
