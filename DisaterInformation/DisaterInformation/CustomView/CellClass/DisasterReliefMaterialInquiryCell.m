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
    NSString *str = [NSString stringWithFormat:@"%ld box",model.MaterialsNumbers];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString: str ];
    NSRange range = NSMakeRange(0, 4);
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    self.numberLabel.attributedText = attribute;
    self.MaterialsImageView.image = [UIImage imageNamed:model.urlImage];

}

@end
