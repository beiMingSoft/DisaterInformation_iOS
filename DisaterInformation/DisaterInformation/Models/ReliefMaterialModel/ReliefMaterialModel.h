//
//  ReliefMaterialModel.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/15.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReliefMaterialModel : NSObject



/**
 * 物资图片
 */
@property(nonatomic ,copy)NSString *urlImage;

/**
 * 物资名称
 */
@property(nonatomic ,copy)NSString *MaterialsName;

/**
 * 物资存储点
 */
@property(nonatomic ,copy)NSString *MaterialsAddress;

/**
 * 物资数量
 */
@property(nonatomic ,assign)NSInteger MaterialsNumbers;


/**
 * 物资查询时间
 */
@property(nonatomic ,copy)NSString *CheckTime;



@end
