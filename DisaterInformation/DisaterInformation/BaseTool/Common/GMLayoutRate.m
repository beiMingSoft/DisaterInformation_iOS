//
//  GMLayoutRate.c
//  GmLoanClient
//
//  Created by WBYAN on 16/7/13.
//  Copyright © 2016年 GomeFinance. All rights reserved.
//

#include "GMLayoutRate.h"
#include "Define.h"

float layoutRateByHeight(float orginLayout){
    
    //以5 为准
    if (DEVICE_HEIGHT  == 568) {
        return 1 * orginLayout;
    } else if (DEVICE_HEIGHT > 568) {
        return 1 * orginLayout;
    } else if (DEVICE_HEIGHT > 480) {
        return 0.85 * orginLayout;
    }
    return 0.85 * orginLayout;
}



@implementation GMLayoutRate : NSObject

+ (CGFloat)layoutRateByOCHeight:(CGFloat)orginLayout
{
    if (DEVICE_HEIGHT > 667) {
        return 1 * orginLayout;
    } else if (DEVICE_HEIGHT > 568) {
        return 1 * orginLayout;
    } else if (DEVICE_HEIGHT > 480) {
        return 0.85 * orginLayout;
    }
    return 0.85 * orginLayout;
}

@end
