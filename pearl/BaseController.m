//
//  BaseController.m
//  pearl
//
//  Created by huangmin on 22/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self configureNavigationItem];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureNavigationBar];
}
-(void)configureNavigationItem
{
    [self.navigationItem.backBarButtonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                                  forBarMetrics:UIBarMetricsDefault];
    
}
-(void)configureNavigationBar
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:UIFont.regular(20),
                                                                    NSForegroundColorAttributeName:UIColor.hexColor(@"#0f000c")};
}
// 清楚磁盘或内存中图片所占资源
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache]cleanDisk];
    [[SDImageCache sharedImageCache]clearMemory];
}
@end
