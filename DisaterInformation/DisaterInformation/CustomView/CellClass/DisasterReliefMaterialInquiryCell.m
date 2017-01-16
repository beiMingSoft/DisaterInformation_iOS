//
//  DisasterReliefMaterialInquiryCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/15.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterReliefMaterialInquiryCell.h"
#import "ReliefMaterialModel.h"
@implementation DisasterReliefMaterialInquiryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(ReliefMaterialModel *)model
{
    self.MaterialsNameLabel.text = model.MaterialsName;
    self.MaterialsAddressLabel.text = model.MaterialsAddress;
    self.checkTimeLabel.text = model.CheckTime;
    self.numberLabel.text = [NSString stringWithFormat:@"Total %ld box",model.MaterialsNumbers];
    self.MaterialsImageView.image = [UIImage imageNamed:model.urlImage];

}

@end
