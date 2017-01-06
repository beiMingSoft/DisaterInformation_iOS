//
//  DisasterWarningCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DisasterWarningModel;
@interface DisasterWarningCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fromLabel;

@property(nonatomic ,strong)DisasterWarningModel *model;


@end
