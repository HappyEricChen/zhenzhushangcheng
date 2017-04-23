//
//  AdsCell.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "AdsCell.h"
#import "TPAds.h"
@interface AdsCell()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *scrollView;
@end
@implementation AdsCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.scrollView.autoScrollTimeInterval = 4.f;
    self.scrollView.delegate = self;
    self.scrollView.currentPageDotColor = UIColor.blackColor;
    self.scrollView.pageDotColor = UIColor.hexColor(@"#00000044");
    self.scrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
}
#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView
   didSelectItemAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(adsCell:didSelectedAtIndex:)])
    {
        [self.delegate adsCell:self
            didSelectedAtIndex:index];
    }
}
#pragma mark 重写分类方法
-(void)setContent:(NSArray*)content
{
    if (isArr(content))
    {
        NSMutableArray* imageURLStringsGroup = @[].mutableCopy;
        for (TPAds* ads in content)
        {
            if ([ads isKindOfClass:TPAds.class])
            {
                imageURLStringsGroup.appendObj(ads.media.url.URLEncodedString);
            }
        }
        if (self.scrollView.imageURLStringsGroup &&
            [self.scrollView.imageURLStringsGroup isEqualToArray:imageURLStringsGroup])
        {
            // 忽略
        }
        else
        {
            // 重置
            self.scrollView.imageURLStringsGroup = imageURLStringsGroup;
        }
    }
}
+(CGSize)contentSize
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 0.375*UIScreen.mainScreen.bounds.size.width);
}
#pragma mark 重写 prepareForReuse
-(void)prepareForReuse
{
    [self.contentView fadeAnimation];
    [super prepareForReuse];
}
@end
