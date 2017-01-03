//
//  DisasterModel.m
//  Disaster information
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterModel.h"

@implementation DisasterModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)trendWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
