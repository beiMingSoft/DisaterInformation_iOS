//
//  DisasterWarningCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterWarningCell.h"
#import "DisasterWarningModel.h"
@implementation DisasterWarningCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setModel:(DisasterWarningModel *)model
{
    self.mainTitleLabel.text = model.mainTitle;
    
    MMLog(@"图片%@", model.urlStr)
    model.cellHeight = 0;
    if (model.urlStr.length) {
        self.urlImageView.image = [UIImage imageNamed:model.urlStr];
        model.cellHeight = 200;

    }else{
        self.urlImageView.image = nil;
        model.cellHeight = 90;

    }


    self.timeLabel.text = model.time;
    self.fromLabel.text = model.from;

    // 强制布局
    [self layoutIfNeeded];

}



@end
