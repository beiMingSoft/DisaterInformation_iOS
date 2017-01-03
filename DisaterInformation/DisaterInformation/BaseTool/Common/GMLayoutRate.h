//
//  GMLayoutRate.h
//  GmLoanClient
//
//  Created by WBYAN on 16/7/13.
//  Copyright © 2016年 GomeFinance. All rights reserved.
//

#ifndef GMLayoutRate_h
#define GMLayoutRate_h
#import <UIKit/UIKit.h>
#include <stdio.h>
#import <OpenGLES/ES1/gl.h>

float layoutRateByHeight(float orginLayout);
#endif /* GMLayoutRate_h */


@interface GMLayoutRate :NSObject

+ (CGFloat)layoutRateByOCHeight:(CGFloat)orginLayout;

@end
