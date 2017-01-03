//
//  SecondImageviewCell.h
//  Disaster information
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DisasterModel;
@interface SecondImageviewCell : UITableViewCell
/**
 * 图标
 */
@property(nonatomic ,strong)UIImageView *urlImageView;

/**
 * 标题
 */
@property(nonatomic ,strong)UILabel *titleNameLabel;
/**
 * 图标
 */
@property(nonatomic ,strong)UIImageView *urlImageView2;

/**
 * 标题
 */
@property(nonatomic ,strong)UILabel *titleNameLabel2;

/**
 * 分割线
 */
@property(nonatomic ,strong)UIView *sqliteView;
-(void)setDisaterModel:(DisasterModel *)model;


@end
