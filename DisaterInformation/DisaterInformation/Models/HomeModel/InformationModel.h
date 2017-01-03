//
//  InformationModel.h
//  Disaster information
//
//  Created by ya Liu on 2016/11/23.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationModel : NSObject
/**
 * 图标
 */
@property(nonatomic ,copy)NSString *url;

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
 * 评论
 */
@property(nonatomic ,assign)NSInteger reviewNumber;
/**
 * 转发
 */
@property(nonatomic ,assign)NSInteger forwardNumber;



@end
