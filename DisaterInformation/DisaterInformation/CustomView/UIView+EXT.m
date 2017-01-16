//
//  UIView+EXT.m
//  Ipaddown
//
//  Created by mac on 14-3-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIView+EXT.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_6_1
#import <QuartzCore/QuartzCore.h>
#endif

@implementation UIView (EXT)

-(void)makeCorner:(float)r
{
    if (r<0) {
        r=0;
    }
    self.layer.cornerRadius = r;
    self.layer.masksToBounds = YES;
}

-(void)setWidth:(float)width
{
    CGRect f = self.frame;
    f.size.width = width;
    self.frame = f;
}
-(float)width
{
    return self.frame.size.width;
}

- (float) height {
    return self.frame.size.height;
}
- (void) setHeight:(float)height {
    CGRect f = self.frame;
    f.size.height = height;
    
    self.frame = f;
}

- (float) x {
    return self.frame.origin.x;
}
- (void) setX:(float)x {
    CGRect f = self.frame;
    f.origin.x = x;
    
    self.frame = f;
}
- (float) y {
    return self.frame.origin.y;
}
- (void) setY:(float)y {
    CGRect f = self.frame;
    f.origin.y = y;
    
    self.frame = f;
}

@end
