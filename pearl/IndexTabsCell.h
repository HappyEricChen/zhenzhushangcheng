//
//  IndexTabsCell.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IndexTabsCell;
@protocol IndexTabsCellDelegate <NSObject>
@optional
-(void)indexTabsCell:(IndexTabsCell*)indexTabsCell
  didSelectedAtIndex:(NSInteger)index;
@end
@interface IndexTabsCell : UICollectionViewCell
@property (weak, nonatomic) id <IndexTabsCellDelegate>delegate;
@end
