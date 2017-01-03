//
//  DisasterFirstCell.h
//  Disaster information
//
//  Created by ya Liu on 2016/11/28.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DisasterModel;

@interface DisasterFirstCell : UITableViewCell
/**
 * 图标
 */
@property(nonatomic ,strong)UIImageView *urlImageView;

/**
 * 标题
 */
@property(nonatomic ,strong)UILabel *titleNameLabel;


/**
 * 时间
 */
@property(nonatomic ,strong)UILabel *timeLabel;

/**
 * 来源
 */
@property(nonatomic ,strong)UILabel *fromeLabel;

/**
 * 分割线
 */
@property(nonatomic ,strong)UIView *sqliteView;

-(void)setDisaterModel:(DisasterModel *)model;





@end
