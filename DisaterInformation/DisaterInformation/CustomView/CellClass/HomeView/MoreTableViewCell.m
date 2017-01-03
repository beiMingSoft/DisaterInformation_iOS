//
//  MoreTableViewCell.m
//  Disaster information
//
//  Created by ya Liu on 2016/11/23.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "InformationModel.h"
@implementation MoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setInformationModel:(InformationModel *)model
{

    
    self.urlImageView.image = [UIImage imageNamed:@"home_btn_travel"];
    self.mainTitleLabel.text  = model.mainTitle;
    self.descriptionLabel.text = model.descriptionTitle;
    self.browerLabel.text = [NSString stringWithFormat:@"浏览 %ld",model.browseNumber];
    self.reviewLabel.text = [NSString stringWithFormat:@"评论 %ld",model.reviewNumber];
    self.forwardLabel.text = [NSString stringWithFormat:@"转发 %ld",model.forwardNumber];

}
@end
