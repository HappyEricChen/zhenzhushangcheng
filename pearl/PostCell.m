//
//  PostCell.m
//  pearl
//
//  Created by huangmin on 23/04/2017.
//  Copyright © 2017 Zhuyu. All rights reserved.
//

#import "PostCell.h"
#import "TPPost.h"
@interface PostCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tabLabel;
@end
@implementation PostCell

-(void)awakeFromNib
{
    [super awakeFromNib];
}
-(void)setContent:(TPPost*)content
{
    if ([content isKindOfClass:TPPost.class])
    {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:content.media.url.URLEncodedString]];
        self.titleLabel.text = content.title;
        if (content.tags.count > 0)
        {
            self.tabLabel.text = [NSString stringWithFormat:@"[ %@ ]",[content.tags componentsJoinedByString:@" , "]];
        }
    }
}
+(CGSize)contentSize
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, (UIScreen.mainScreen.bounds.size.width-40)*2/3+60);
}
@end
