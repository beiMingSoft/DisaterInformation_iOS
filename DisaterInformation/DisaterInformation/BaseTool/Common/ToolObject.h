//
//  ToolObject.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolObject : NSObject
/**
 * 返回导航条Item
 */
+ (UIBarButtonItem *)backBarButtonWithImageName:(NSString *)imageName  select:(SEL)select target:(id)target;

/**
 *  导航栏item  自定义图片偏移量
 *
 */
+ (UIBarButtonItem *)backBarButtonWithImageName:(NSString *)imageName imageEdgeInset:(UIEdgeInsets)edgeInset select:(SEL)select target:(id)target;
@end
