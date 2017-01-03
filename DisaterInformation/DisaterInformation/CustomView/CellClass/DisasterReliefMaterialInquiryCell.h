//
//  DisasterReliefMaterialInquiryCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/15.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReliefMaterialModel;
@interface DisasterReliefMaterialInquiryCell : UITableViewCell
@property(nonatomic ,strong)ReliefMaterialModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *MaterialsImageView;

@property (weak, nonatomic) IBOutlet UILabel *MaterialsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *MaterialsAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *MaterialsNumbersLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end
