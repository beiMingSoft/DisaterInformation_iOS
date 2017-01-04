//
//  CustomHeaderView.h
//  Zhenghe
//
//  Created by ya Liu on 2016/10/4.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendActionAndIndexDelegate <NSObject>

-(void)buttonAndId:(NSInteger)index;

@optional
-(void)moreButtonClicked;

@end



@interface CustomHeaderView : UICollectionReusableView
@property(nonatomic ,assign)id<sendActionAndIndexDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame city:(NSString *)city cityName:(NSString *)cityName   imageArray:(NSArray *)imgArray titleArray:(NSArray *)titleArr  spots:(NSString *)spotsTitle moreTitle:(NSString *)mTitle ColCount:(NSInteger)col;

@end
