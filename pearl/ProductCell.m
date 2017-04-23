//
//  ProductCell.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "ProductCell.h"
#import "TPProduct.h"
@interface ProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *salePriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *listPriceLabel;
@end
@implementation ProductCell

-(void)awakeFromNib
{
    [super awakeFromNib];
}
#pragma mark 重写 UIView_Extension
-(void)setContent:(TPProduct*)content
{
    if ([content isKindOfClass:TPProduct.class])
    {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:content.media.url.URLEncodedString]];
        self.titleLabel.text = content.title;
        self.salePriceLabel.text = [NSString stringWithFormat:@"%@%.2lf",content.currency,content.salePrice.doubleValue];
        if (content.listPrice)
        {
            self.listPriceLabel.attributedText = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"市场价 %@%.2lf",content.currency,content.listPrice.doubleValue] attributes:@{NSFontAttributeName:UIFont.regular(12),NSForegroundColorAttributeName:UIColor.hexColor(@"#969696"),NSStrikethroughStyleAttributeName:@1}];
        
        }
        else
        {
            self.listPriceLabel.attributedText = nil;
        }
    }
}
+(CGSize)contentSize
{
    return CGSizeMake((UIScreen.mainScreen.bounds.size.width-50)/2, (UIScreen.mainScreen.bounds.size.width-50)/2+5+40+10+17+10);
}
#pragma mark 重写 prepareForReuse
-(void)prepareForReuse
{
    [self.contentView fadeAnimation];
    [super prepareForReuse];
}
@end
