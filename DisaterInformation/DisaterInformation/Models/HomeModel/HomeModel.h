//
//  HomeModel.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

/**
 * 图标
 */
@property(nonatomic ,copy)NSString *urlStr;

/**
 * 标题
 */
@property(nonatomic ,copy)NSString *mainTitle;

/**
 * 描述
 */
@property(nonatomic ,copy)NSString *descriptionTitle;

/**
 * 浏览
 */
@property(nonatomic ,assign)NSInteger browseNumber;

/**
 * 收藏
 */
@property(nonatomic ,assign)NSInteger collectionNumber;

/**
 * 点赞
 */
@property(nonatomic ,assign)NSInteger likeNumber;



@end
