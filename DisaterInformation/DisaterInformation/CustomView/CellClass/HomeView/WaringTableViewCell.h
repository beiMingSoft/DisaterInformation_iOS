//
//  WaringTableViewCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/10.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DisasterWarningModel;
@interface WaringTableViewCell : UITableViewCell

@property(nonatomic ,strong)DisasterWarningModel *model;
/**
 * 图标
 */
@property(nonatomic ,strong)UIImageView *urlImageView;

/**
 * 标题
 */
@property(nonatomic ,strong)UILabel *mainTitleLabel;

/**
 * 时间
 */
@property(nonatomic ,strong)UILabel *timeLabel;

/**
 * 来源
 */
@property(nonatomic ,strong)UILabel *fromLabel;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(DisasterWarningModel *)waringModel;




@end
