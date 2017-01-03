//
//  HomeCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "HomeCell.h"
#import "HomeModel.h"
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.browseButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHomeModel:(HomeModel *)model
{
    
    self.urlImageView.image = [UIImage imageNamed:@"home_btn_travel"];
    self.mainTitleLabel.text = model.mainTitle;
    self.descriptionLabel.text = model.descriptionTitle;
    [self.browseButton setTitle:[NSString stringWithFormat:@"%ld",model.browseNumber] forState:UIControlStateNormal];
    [self.collectionButton setTitle:[NSString stringWithFormat:@"%ld",model.collectionNumber]  forState:UIControlStateNormal];
    [self.likeButton setTitle:[NSString stringWithFormat:@"%ld",model.likeNumber]  forState:UIControlStateNormal];

}


@end
