//
//  selfRescueCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/10.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "selfRescueCell.h"

@implementation selfRescueCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.numberLabel = [[UILabel alloc]init ];
        self.numberLabel.textColor = [UIColor whiteColor];
        self.numberLabel.backgroundColor = [UIColor colorWithRGBString:COLOR_ef8666];
        self.numberLabel.font = font14;
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.numberLabel];
        
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(@20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        self.urlImageView = [[UIImageView alloc]init ];
        [self.contentView addSubview:self.urlImageView];
        
        [self.urlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.numberLabel.mas_bottom).offset(5);
            make.centerX.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        
        self.contentLabel  = [[UILabel alloc]init ];
        self.contentLabel.font = font14;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.textColor = [UIColor colorWithRGBString:COLOR_BLACK_333333];
        [self.contentView addSubview:self.contentLabel];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.urlImageView.mas_bottom).offset(0);
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.height.offset(60);
        }];
        
    }
    return self;
}

@end
