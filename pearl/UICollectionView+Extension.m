//
//  UICollectionView+Extension.m
//  luckynumber
//
//  Created by huangmin on 10/04/2017.
//  Copyright © 2017 YedaoDev. All rights reserved.
//

#import "UICollectionView+Extension.h"

@implementation UICollectionView (Extension)
-(UICollectionView*(^)(NSArray*))registerClasses
{
    return ^(NSArray* classes)
    {
        for (Class class in classes)
        {
            [self registerClass:class
     forCellWithReuseIdentifier:NSStringFromClass(class)];
        }
        return self;
    };
}
-(UICollectionView *(^)(NSArray *))registerNibs
{
    return ^(NSArray* classes)
    {
        for (Class class in classes)
        {
            [self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil]
   forCellWithReuseIdentifier:NSStringFromClass(class)];
        }
        return self;
    };
}
-(UICollectionView*(^)(Class, NSString* ))registerHeaderFooterClass
{
    return ^(Class class, NSString* kind)
    {
        [self registerClass:class
 forSupplementaryViewOfKind:kind
        withReuseIdentifier:NSStringFromClass(class)];
        return self;
    };
}
-(UICollectionView*(^)(Class, NSString*))registerHeaderFooterNib
{
    return ^(Class class, NSString* kind)
    {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(class)
                                         bundle:nil]
forSupplementaryViewOfKind:kind
      withReuseIdentifier:NSStringFromClass(class)];
        return self;
    };
}
-(UICollectionView *(^)(UIEdgeInsets))insets
{
    return ^(UIEdgeInsets contentInset)
    {
        self.contentInset = contentInset;
        return self;
    };
}
-(UICollectionView*(^)(id))configureDelegate
{
    return ^(id target)
    {
        self.delegate = target;
        return self;
    };
}
-(UICollectionView*(^)(id))configureDataSource
{
    return ^(id target)
    {
        self.dataSource = target;
        return self;
    };
}
@end
