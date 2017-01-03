//
//  DisasterWarningModel.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisasterWarningModel : NSObject
/**
 * 标题
 */
@property(nonatomic ,copy)NSString *mainTitle;


/**
 * 图片
 */
@property(nonatomic ,copy)NSString *urlStr;

/**
 * 时间
 */
@property(nonatomic ,copy)NSString *time;

/**
 * 来源
 */
@property(nonatomic ,copy)NSString *from;


/**
 * 是否有封面图
 */
@property(nonatomic ,assign)BOOL isPic;

@property (nonatomic, assign) CGFloat cellHeight;


@end
