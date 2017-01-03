//
//  SecondImageviewCell.m
//  Disaster information
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "SecondImageviewCell.h"
#import "DisasterModel.h"

@implementation SecondImageviewCell

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
    [self.contentView addSubview:self.urlImageView2];
    [self.contentView addSubview:self.titleNameLabel2];
    [self.contentView addSubview:self.sqliteView];
    
    
    [self.urlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(self.urlImageView2.mas_left).offset(-12);
        make.height.offset(140);
        make.width.equalTo(self.urlImageView2);
        
    }];
    
    [self.titleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.urlImageView.mas_bottom).offset(5);
        make.left.equalTo(self.urlImageView);
        make.right.equalTo(self.urlImageView);
        make.height.offset(20);
        make.width.equalTo(self.urlImageView2);
        
    }];
    
    [self.urlImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(@12);
        make.left.equalTo(self.urlImageView.mas_right).offset(12);
        make.right.equalTo(self.mas_right).offset(-12);
        make.height.equalTo(self.urlImageView);
        make.width.equalTo(self.urlImageView);
        
    }];
    
    [self.titleNameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.urlImageView.mas_bottom).offset(5);
        make.left.equalTo(self.urlImageView2);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.offset(20);
        
    }];


    [self.sqliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleNameLabel.mas_bottom).offset(5);
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

-(UIImageView *)urlImageView2
{
    if (!_urlImageView2){
        _urlImageView2= [[UIImageView alloc] init ];
    }
    return _urlImageView2;
}

-(UILabel *)titleNameLabel2
{
    if (!_titleNameLabel2) {
        _titleNameLabel2 = [[UILabel alloc]init ];
    }
    return _titleNameLabel2;
    
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
    self.urlImageView2.backgroundColor =kCOLORRANDOM ;
    self.titleNameLabel.text = model.text;
    self.titleNameLabel2.text = model.time;
}


@end
