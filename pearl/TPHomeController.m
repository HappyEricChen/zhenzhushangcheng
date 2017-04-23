//
//  TPHomeController.m
//  pearl
//
//  Created by huangmin on 22/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPHomeController.h"
#import "AdsCell.h"
#import "IndexTabsCell.h"
#import "PostCell.h"
#import "ProductCell.h"
#import "HomeSectionHeaderView.h"

#import "TPAds.h"
#import "TPIndexTab.h"
#import "TPPost.h"
#import "TPProduct.h"
@interface TPHomeController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AdsCellDelegate, IndexTabsCellDelegate>
@property (strong, nonatomic) BaseCollectionView* collectionView;
@property (strong, nonatomic) NSArray<TPAds*>* adsList;
@property (strong, nonatomic) NSArray<TPIndexTab*>* indexTabs;
@property (strong, nonatomic) NSArray<TPPost*>* posts;
@property (strong, nonatomic) NSArray<TPProduct*>* products;
@property (strong, nonatomic) NSDictionary* postHeaderDic;
@property (strong, nonatomic) NSDictionary* productHeaderDic;
@end

@implementation TPHomeController
- (void)viewDidLoad
{
    [super viewDidLoad];
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = (BaseCollectionView*)[[BaseCollectionView alloc]initWithCollectionViewLayout:flowLayout].
    registerNibs(@[AdsCell.class,IndexTabsCell.class,PostCell.class,ProductCell.class]).
    registerHeaderFooterNib(HomeSectionHeaderView.class,UICollectionElementKindSectionHeader).
    configureDataSource(self).
    configureDelegate(self);
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.top.equalTo(self.view);
    }];
    [self loadData];
}
-(void)loadData
{
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pearl" ofType:@"json"]];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:nil];
    self.adsList = [NSArray yy_modelArrayWithClass:TPAds.class
                                              json:[json jsonForKey:@"ads"]];
    self.indexTabs = [NSArray yy_modelArrayWithClass:TPIndexTab.class
                                                json:[json jsonForKey:@"indexTabs"]];
    self.posts = [NSArray yy_modelArrayWithClass:TPPost.class json:[[json jsonForKey:@"posts"] jsonForKey:@"list"]];
    self.products = [NSArray yy_modelArrayWithClass:TPProduct.class json:[[json jsonForKey:@"products"] jsonForKey:@"list"]];
    self.postHeaderDic = [[json jsonForKey:@"posts"]jsonForKey:@"sectionHeader"];
    self.productHeaderDic = [[json jsonForKey:@"products"]jsonForKey:@"seactionHeader"];
    [self.collectionView reloadData];
}
#pragma mark 重写父类方法
-(void)configureNavigationItem
{
    [super configureNavigationItem];
    UIImageView*imageview = (UIImageView*)[[UIImageView alloc]initWithImage:UIImage.imageName(@"logo")].mode(UIViewContentModeScaleAspectFit);
    self.navigationItem.titleView = imageview;
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage.imageName(@"cart")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(goToShoppingCart:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.adsList.count>0?1:0;
    }
    else if (section == 1)
    {
        return self.indexTabs.count>0?1:0;
    }
    else if (section == 2)
    {
        return self.posts.count;
    }
    else if (section == 3)
    {
        return self.products.count;
    }
    return 0;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        AdsCell* cell = [AdsCell collectionView:collectionView
                                      indexPath:indexPath];
        [cell setContent:self.adsList];
        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        IndexTabsCell* cell = [IndexTabsCell collectionView:collectionView
                                                  indexPath:indexPath];
        [cell setContent:self.indexTabs];
        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section == 2)
    {
        PostCell* cell = [PostCell collectionView:collectionView
                                        indexPath:indexPath];
        [cell setContent:self.posts[indexPath.item]];
        return cell;
    }
    else if (indexPath.section == 3)
    {
        ProductCell* cell = [ProductCell collectionView:collectionView
                                              indexPath:indexPath];
        [cell setContent:self.products[indexPath.item]];
        return cell;
    }
    @throw NSException.dataSourceException;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
         viewForSupplementaryElementOfKind:(NSString *)kind
                               atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HomeSectionHeaderView* view = [HomeSectionHeaderView collectionView:collectionView
                                          viewForSupplementaryElementOfKind:kind
                                                                atIndexPath:indexPath];
        if (indexPath.section == 2)
        {
            [view setContent:self.postHeaderDic];
        }
        else if (indexPath.section == 3)
        {
            [view setContent:self.productHeaderDic];
        }
        return view;
    }
    return nil;
}
#pragma mark UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return AdsCell.contentSize;
    }
    else if (indexPath.section == 1)
    {
        return IndexTabsCell.contentSize;
    }
    else if (indexPath.section == 2)
    {
        TPPost* post = self.posts[indexPath.item];
        return CGSizeMake(PostCell.contentSize.width, post.estimatedHeight);
    }
    else if (indexPath.section == 3)
    {
        return ProductCell.contentSize;
    }
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section
{
    if ((section == 2 && self.postHeaderDic) || (section == 3 && self.productHeaderDic))
    {
        return HomeSectionHeaderView.contentSize;
    }
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 0);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 3)
    {
        return 10;
    }
    return 0;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    if (section == 3 && self.products.count>0)
    {
        return UIEdgeInsetsMake(10, 20, 0, 20);
    }
    return UIEdgeInsetsZero;
}
#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
#warning todo
}
#pragma mark 导航栏按钮 点击事件
-(void)goToShoppingCart:(UIBarButtonItem*)buttonItem
{
    
}
#pragma mark AdsCellDelegate
-(void)adsCell:(AdsCell *)adsCell didSelectedAtIndex:(NSInteger)index
{
    
}
#pragma mark IndexTabsCellDelegate
-(void)indexTabsCell:(IndexTabsCell *)indexTabsCell didSelectedAtIndex:(NSInteger)index
{
    
}
@end
