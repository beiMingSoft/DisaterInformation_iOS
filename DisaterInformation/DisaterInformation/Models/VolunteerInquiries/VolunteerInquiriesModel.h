//
//  VolunteerInquiriesModel.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/21.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VolunteerInquiriesModel : NSObject

/**
 * 封图
 */
@property(nonatomic ,copy)NSString *imageStr;

/**
 * 姓名
 */
@property(nonatomic ,copy)NSString *name;

/**
 * 电话
 */
@property(nonatomic ,copy)NSString *tel;

/**
 * 地址
 */
@property(nonatomic ,copy)NSString *address;



@end
