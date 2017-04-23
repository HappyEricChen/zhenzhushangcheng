//
//  TPMainTabBarController.m
//  pearl
//
//  Created by huangmin on 22/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "TPMainTabBarController.h"

@interface TPMainTabBarController ()

@end

@implementation TPMainTabBarController
-(void)awakeFromNib
{
    [super awakeFromNib];
    // 修改标签栏图片的位置及使用图片的渲染效果
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.image = [obj.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [obj.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
}
@end
