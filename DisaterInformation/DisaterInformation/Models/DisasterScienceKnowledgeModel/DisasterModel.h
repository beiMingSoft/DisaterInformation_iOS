//
//  DisasterModel.h
//  Disaster information
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisasterModel : NSObject

@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *time; // 时间
@property (nonatomic, copy) NSString *from; // 来源
@property (nonatomic, copy) NSString *picture; // 配图
/// cell 高度
@property (assign,nonatomic) CGFloat cellHeight;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)trendWithDict:(NSDictionary *)dict;

@end
