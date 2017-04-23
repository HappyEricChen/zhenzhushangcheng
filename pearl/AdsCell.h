//
//  AdsCell.h
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdsCell;
@protocol AdsCellDelegate <NSObject>
@optional
-(void)adsCell:(AdsCell*)adsCell didSelectedAtIndex:(NSInteger)index;
@end
@interface AdsCell : UICollectionViewCell
@property (weak, nonatomic) id<AdsCellDelegate>delegate;
@end
