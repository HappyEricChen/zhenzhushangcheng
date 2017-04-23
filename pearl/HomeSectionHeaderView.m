//
//  HomeSectionHeaderView.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "HomeSectionHeaderView.h"
@interface HomeSectionHeaderView()
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIButton* actionBtn;
@end
@implementation HomeSectionHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
}
#pragma mark 重写 UIView_Extension
-(void)setContent:(NSDictionary*)content
{
    if (isDic(content))
    {
        self.titleLabel.text = [content safe_stringForKey:@"name"];
        self.actionBtn.hidden = [content safe_stringForKey:@"clickUrl"] == nil;
    }
}
+(CGSize)contentSize
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 80.f);
}
@end
