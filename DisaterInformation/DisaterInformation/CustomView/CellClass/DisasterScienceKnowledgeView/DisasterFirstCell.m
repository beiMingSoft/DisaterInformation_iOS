//
//  DisasterFirstCell.m
//  Disaster information
//
//  Created by ya Liu on 2016/11/28.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterFirstCell.h"
#import "DisasterModel.h"
@implementation DisasterFirstCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createLayout];
    }
    return self;
    
}
-(void)createLayout{
    
    self .selectionStyle = NO;
    
    [self.contentView addSubview:self.urlImageView];
    [self.contentView addSubview:self.titleNameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.fromeLabel];
    [self.contentView addSubview:self.sqliteView];
    
    
    [self.urlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.height.offset(GMLAYOUTRATE(120));
        make.width.offset(DEVICE_WIDTH-20);
        
    }];
    
    [self.titleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.urlImageView.mas_bottom).offset(5);
        make.left.equalTo(self.urlImageView);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.offset(20);
        
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleNameLabel);
        make.top.equalTo(self.titleNameLabel.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(GMLAYOUTRATE(60), 20));
    }];
    
    [self.fromeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel);
        make.left.equalTo(self.timeLabel.mas_right).offset(5);
        make.size.equalTo(self.timeLabel);
    }];
    
    
    [self.sqliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fromeLabel.mas_bottom).offset(5);
        make.left.right.offset(0);
        make.height.offset(1);
        
    }];
    
}

-(UIImageView *)urlImageView
{
    if (!_urlImageView){
        _urlImageView= [[UIImageView alloc] init ];
    }
    return _urlImageView;
}

-(UILabel *)titleNameLabel
{
    if (!_titleNameLabel) {
        _titleNameLabel = [[UILabel alloc]init ];
    }
    return _titleNameLabel;
    
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init ];
        _timeLabel.font =font12;
        _timeLabel.textColor = [UIColor colorWithRGBString:COLOR_646464];
    }
    
    return _timeLabel;
}

-(UILabel *)fromeLabel
{
    if (!_fromeLabel) {
        _fromeLabel = [[UILabel alloc]init ];
        _fromeLabel.font =font12;
        _fromeLabel.textColor = [UIColor colorWithRGBString:COLOR_646464];
    }
    return _fromeLabel;
}

-(UIView *)sqliteView
{
    
    if (!_sqliteView) {
        _sqliteView  = [[UIView alloc]init ];
    }
    return _sqliteView;
    
}

-(void)setDisaterModel:(DisasterModel *)model
{
        self.urlImageView .backgroundColor = kCOLORRANDOM;
        self.titleNameLabel.text = model.text;
        self.timeLabel.text = model.time;
        self.fromeLabel.text = model.from;
}



@end
