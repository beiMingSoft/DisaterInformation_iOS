//
//  WaringTableViewCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/10.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "WaringTableViewCell.h"
#import "DisasterWarningModel.h"
@implementation WaringTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(DisasterWarningModel *)waringModel{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图标
        self.urlImageView = [[UIImageView alloc]init ];
        [self.contentView addSubview:self.urlImageView];
        //标题
        self.mainTitleLabel = [[UILabel alloc]init ];
        self.mainTitleLabel.font = font14;
        self.mainTitleLabel.numberOfLines = 2;
        self.mainTitleLabel.textColor = [UIColor colorWithRGBString:COLOR_BLACK_333333];
        [self.contentView addSubview:self.mainTitleLabel];
        
        //时间
        self.timeLabel = [[UILabel alloc]init ];
        self.timeLabel.font = font12;
        self.timeLabel.textColor = [UIColor colorWithRGBString:COLOR_LIGHTGRAY_666666];
        [self.contentView addSubview:self.timeLabel];
        
        
        //来源
        self.fromLabel = [[UILabel alloc]init ];
        self.fromLabel.font = font12;
        self.fromLabel.textColor = [UIColor colorWithRGBString:COLOR_LIGHTGRAY_666666];
        [self.contentView addSubview:self.fromLabel];
        
        if (waringModel.isPic) {
            [self.urlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@10);
                make.left.equalTo(@15);
                make.height.offset(60);
                make.width.equalTo(@60);
            }];
        }else{
        [self.urlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.left.equalTo(@15);
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
        }
        
        CGRect mainRect = [waringModel.mainTitle boundingRectWithSize:CGSizeMake(DEVICE_WIDTH - 100, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font12} context:nil] ;
        [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.left.equalTo(self.urlImageView.mas_right).offset(16);
            make.right.equalTo(@-10);
            make.height.offset(mainRect.size.height);
        }];
        
      
        CGRect rect = [waringModel.time boundingRectWithSize:CGSizeMake(self.timeLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font12} context:nil] ;
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mainTitleLabel);
            make.height.equalTo(@16);
            make.width.offset(rect.size.width);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        
        [self.fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLabel.mas_right).offset(5);
            make.right.equalTo(@-10);
            make.height.equalTo(@16);
            make.bottom.equalTo(self.timeLabel);
        }];

    }

    return self;
}



@end
