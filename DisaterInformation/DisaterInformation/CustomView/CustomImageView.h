//
//  CustomImageView.h
//  首钢日报
//
//  Created by 于非州 on 14-5-12.
//  Copyright (c) 2014年 newgen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIImageView

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) NSArray *rightButtons;
@property (nonatomic, strong) id imgModel;
@property (nonatomic, copy) NSString *videoURL;
@property (nonatomic, copy) NSString *originalURL;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) BOOL isDownloadingImage;

-(void)addTarget:(id)target action:(SEL)action;

@end
