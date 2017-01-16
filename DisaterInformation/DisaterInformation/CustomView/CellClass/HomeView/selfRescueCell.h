//
//  selfRescueCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/10.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selfRescueCell : UITableViewCell
/**
 * 图签
 */
@property(nonatomic ,strong)UILabel *numberLabel;

/**
 * 图标
 */
@property(nonatomic ,strong)UIImageView *urlImageView;


/**
 * 内容
 */
@property(nonatomic ,strong)UILabel *contentLabel;


@end
