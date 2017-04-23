//
//  IndexTabsCell.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "IndexTabsCell.h"
#import "TPIndexTab.h"
@interface IndexTabButton : UIButton
@end
@implementation IndexTabButton
-(instancetype)init
{
    if (self = [super init])
    {
        [self setBackgroundImage:[UIImage imageWithColor:UIColor.hexColor(@"#969696")]
                        forState:UIControlStateHighlighted];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = UIFont.regular(12);
        [self setTitleColor:UIColor.hexColor(@"#0f000c")
                   forState:UIControlStateNormal];
        self.imageView.bordthColor(UIColor.clearColor).bordthWidth(1.f).cornerRadius(30.f).mode(UIViewContentModeScaleAspectFit);
    }
    return self;
}
#pragma mark 重写UIButton方法
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 100, CGRectGetWidth(contentRect), 20);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((CGRectGetWidth(contentRect)-60)/2, 30, 60, 60);
}
#pragma mark 重写 UIView_Extension
+(CGSize)contentSize
{
    return CGSizeMake(0, 150);
}
@end


@interface IndexTabsCell()
@property (strong, nonatomic) NSArray<IndexTabButton*>*indexTabButtons;
@property (strong, nonatomic) NSArray<NSString*>* imageUrlGroups;
@property (strong, nonatomic) NSArray<NSString*>* titles;
@end
@implementation IndexTabsCell
static NSInteger maxTabsCount = 4;
- (void)awakeFromNib
{
    [super awakeFromNib];
}
#pragma mark 重新父类方法
-(void)setContent:(NSArray*)content
{
    if (isArr(content))
    {
        NSMutableArray* imageUrlGroups = @[].mutableCopy;
        NSMutableArray* titles = @[].mutableCopy;
        for (NSInteger index = 0; index<MIN(maxTabsCount, content.count); index++)
        {
            TPIndexTab* indexTab = content[index];
            if ([indexTab isKindOfClass:TPIndexTab.class])
            {
                imageUrlGroups.appendObj(indexTab.media.url.URLEncodedString);
                titles.appendObj(indexTab.name);
            }
        }
        BOOL hasModify = NO;
        if (self.imageUrlGroups == nil ||
            (isArr(self.imageUrlGroups) && [self.imageUrlGroups isEqualToArray:imageUrlGroups] == NO))
        {
            hasModify = YES;
            self.imageUrlGroups = imageUrlGroups;
        }
        if (self.titles == nil ||
            (isArr(self.titles) && [self.titles isEqualToArray:titles] == NO))
        {
            hasModify = YES;
            self.titles = titles;
        }
        if (hasModify)
        {
            [self.indexTabButtons enumerateObjectsUsingBlock:^(IndexTabButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj removeFromSuperview];
            }];
            NSMutableArray<IndexTabButton*>* indexTabButtons = @[].mutableCopy;
            NSInteger count = self.titles.count;
            CGFloat width = UIScreen.mainScreen.bounds.size.width/count;
            for (NSInteger index = 0; index<count; index++)
            {
                IndexTabButton* indexTabButton = [IndexTabButton new];
                [indexTabButton setTitle:self.titles[index]
                                forState:UIControlStateNormal];
                [indexTabButton sd_setImageWithURL:[NSURL URLWithString:self.imageUrlGroups[index]]
                                          forState:UIControlStateNormal];
                [indexTabButton addTarget:self
                                   action:@selector(tapAction:)
                         forControlEvents:UIControlEventTouchUpInside];
                indexTabButtons.appendObj(indexTabButton);
                [self.contentView addSubview:indexTabButton];
                [indexTabButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(@(index*width));
                    make.top.bottom.equalTo(@0);
                    make.width.equalTo(@(width));
                }];
            }
        }
    }
}
+(CGSize)contentSize
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, IndexTabButton.contentSize.height);
}
#pragma mark 重写 prepareForReuse
-(void)prepareForReuse
{
    [self.contentView fadeAnimation];
    [super prepareForReuse];
}
#pragma mark UIButton -- Event
-(void)tapAction:(IndexTabButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(indexTabsCell:didSelectedAtIndex:)])
    {
        [self.delegate indexTabsCell:self didSelectedAtIndex:[self.indexTabButtons indexOfObject:sender]];
    }
}
@end
