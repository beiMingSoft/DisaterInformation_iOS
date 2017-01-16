//
//  CustomImageView.m
//  首钢日报
//
//  Created by 于非州 on 14-5-12.
//  Copyright (c) 2014年 newgen. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setTitleView:(UIView *)titleView
{
    if (_titleView) {
        [_titleView removeFromSuperview];
    }
    _titleView = titleView;
    CGRect frame = _titleView.frame;
    if ([_titleView isKindOfClass:[UILabel class]]) {
        frame.size.height = 44;
        frame.size.width = self.frame.size.width*0.7;
        frame.origin.x = 15;
        frame.origin.y = self.frame.size.height - 44;
        _titleView.frame = frame;
        [((UILabel *)_titleView) setTextAlignment:NSTextAlignmentCenter];
    }else if ([_titleView isKindOfClass:[UIImageView class]]) {
        frame.size.height = 35;
        UIImage *img = ((UIImageView *)_titleView).image;
        frame.size.width = img.size.width*35/img.size.height;
        frame.origin.x = (self.frame.size.width-frame.size.width)/2;
        frame.origin.y = self.frame.size.height - 40;
        _titleView.frame = frame;
//        NSLog(@"img.size.width*44/img.size.height======%f",img.size.width*44/img.size.height);
    }
//    NSLog(@"_titleView.class=========%@",_titleView.class);
//    NSLog(@"frame--------------%@",[NSValue valueWithCGRect:frame]);
    [self addSubview:_titleView];
}

-(void)setLeftButton:(UIButton *)leftButton
{
    if (_leftButton) {
        [_leftButton removeFromSuperview];
    }
    _leftButton = leftButton;
    [self addSubview:_leftButton];
}

-(void)setRightButton:(UIButton *)rightButton
{
    if (_rightButton) {
        [_rightButton removeFromSuperview];
    }
    _rightButton = rightButton;
    [self addSubview:_rightButton];
}

-(void)setRightButtons:(NSArray *)rightButtons
{
    for (UIView *v in _rightButtons) {
        [v removeFromSuperview];
    }
    _rightButtons = rightButtons;
    CGRect frame;
    float sWidth = self.frame.size.width;
    float sHeight = self.frame.size.height;
    float rx = sWidth-10;
    for (UIView *v in _rightButtons) {
        frame = v.frame;
        frame.origin.x = rx - v.frame.size.width;
        if (frame.size.height > 44) {
            frame.size.width = frame.size.width*44.0/frame.size.height;
            frame.size.height = 44;
        }
        frame.origin.y = sHeight - 22.0 - frame.size.height/2.0;
        v.frame = frame;
        [self addSubview:v];
        rx = frame.origin.x - 10;
    }
}

-(void)addTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
