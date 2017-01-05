//
//  CustomHeaderView.m
//  Zhenghe
//
//  Created by ya Liu on 2016/10/4.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "CustomHeaderView.h"
#import "UIColor+Extension.h"
@interface CustomHeaderView()


@property(nonatomic ,strong)UIButton *button;

@end


@implementation CustomHeaderView


/**
 

 @param frame      self.view
 @param city       select City
 @param cityName   city Name
 @param imgArray   pictrue Array
 @param titleArr   title Array
 @param spotsTitle section title
 @param mTitle     section check more

 */
-(instancetype)initWithFrame:(CGRect)frame city:(NSString *)city cityName:(NSString *)cityName imageArray:(NSArray *)imgArray titleArray:(NSArray *)titleArr spots:(NSString *)spotsTitle moreTitle:(NSString *)mTitle ColCount:(NSInteger)col
{
    self = [super initWithFrame:frame];
    if (self) {
        // 九宫格
        NSInteger totalloc=col;
        CGFloat appvieww = GMLAYOUTRATE(78.5);
        CGFloat appviewh = GMLAYOUTRATE(78.5);
        CGFloat margin = (DEVICE_WIDTH-totalloc*appvieww)/(totalloc+1);
        for (int  i = 0 ; i < titleArr.count; i++) {
                int row = i/totalloc;//行号
                //1/3=0,2/3=0,3/3=1;
                int loc=i%totalloc;//列号
                CGFloat appviewx = margin+(margin+appvieww)*loc;
                CGFloat appviewy = margin+(margin+appviewh+8)*row;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(appviewx, appviewy, appvieww, appviewh) ;
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
            button.titleLabel.font = font12;
            [button setTitleColor:[UIColor colorWithRGBString:COLOR_SPOTTITLE_111111] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.tag  = 1000+i;
            self.button = button;

            // 按钮图片和标题总高度
            CGFloat totalHeight = (button.imageView.frame.size.height + button.titleLabel.frame.size.height);
            // 设置按钮图片偏移
            [button setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - button.imageView.frame.size.height), 0.0, 0.0, -button.titleLabel.frame.size.width)];
            // 设置按钮标题偏移
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -button.imageView.frame.size.width, -(totalHeight - button.titleLabel.frame.size.height),0.0)];
            [self addSubview: button];
        
        }
        
        UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.button.frame)+20, DEVICE_WIDTH, 5) ];
        lineView.backgroundColor = [UIColor colorWithRGBString:COLOR_LINEVIEW_F0F0F];
        [self addSubview:lineView];
        
        //自然灾害
        UILabel *headLabel = [[UILabel alloc]init ];
        headLabel.text = spotsTitle;
        headLabel.font = font16;
        headLabel.backgroundColor = [UIColor whiteColor];
        headLabel.textColor = [UIColor colorWithRGBString:COLOR_SPOTTITLE_111111];
        [self addSubview:headLabel];
        [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(10);
            make.left.equalTo(@12);
            make.right.equalTo(@-10);
            make.height.equalTo(@20);
        }];
        
        //查看更多
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:mTitle forState:UIControlStateNormal];
        [moreBtn setTitleColor:[UIColor colorWithRGBString:COLOR_646464 ] forState:UIControlStateNormal];
        moreBtn.titleLabel.font =font12;
        [moreBtn setImage:[UIImage imageNamed:@"ViewAll"] forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreClicked) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, GMLAYOUTRATE(85), 0, 0);
        [self addSubview:moreBtn];
        
        
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headLabel);
            make.right.equalTo(@-10);
            make.size.mas_equalTo(CGSizeMake(GMLAYOUTRATE(100), 20));
        }];
        UIView *sqliteView = [[UIView alloc]init ];
        sqliteView.backgroundColor = [UIColor colorWithRGBString:COLOR_LINEVIEW_F0F0F];
//        sqliteView.backgroundColor = [UIColor purpleColor];
        
//        [self addSubview:sqliteView];
//        [sqliteView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(moreBtn.mas_bottom).offset(GMLAYOUTRATE(6));
//            make.left.equalTo(@0);
//            make.width.offset(DEVICE_WIDTH);
//            make.height.offset(1);
//            
//        }];
//        
        NSLog(@"%f",CGRectGetMaxY(sqliteView.frame));
        
    }
    return self;
}

-(void)buttonClicked:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(buttonAndId:)]) {
        [self.delegate buttonAndId:btn.tag];
    }
}

-(void)moreClicked
{
    if ([self.delegate respondsToSelector:@selector(moreButtonClicked)]) {
        
        [self.delegate moreButtonClicked];
        
    }
}


-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
@end
