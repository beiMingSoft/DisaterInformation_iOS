//
//  MTSearchBar.m
//  Zhenghe
//
//  Created by ya Liu on 2016/11/5.
//  Copyright © 2016年 微创软件. All rights reserved.
//
/**
 * 自定义searchbar
 */
#import "MTSearchBar.h"

@implementation MTSearchBar
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.size = CGSizeMake(GMLAYOUTRATE(DEVICE_WIDTH - 80), 30);
        self.font =  font14;
        self.placeholder = @"请输入搜索关键字";
        self.borderStyle = UITextBorderStyleRoundedRect;
        UIImageView *iconImageView = [[UIImageView alloc]init ];
        iconImageView.image = [UIImage imageNamed:@"search"];
        iconImageView.contentMode = UIViewContentModeCenter;
        iconImageView.size = CGSizeMake(30, 30);
        self.leftView = iconImageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self  alloc]init ];

}

@end
