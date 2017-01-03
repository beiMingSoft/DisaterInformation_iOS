//
//  ToolObject.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "ToolObject.h"

@implementation ToolObject

/**
 * 返回导航条Item
 */
+ (UIBarButtonItem *)backBarButtonWithImageName:(NSString *)imageName select:(SEL)select target:(id)target{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    if (!imageName) {
        UIImage *backImage = [self createBackIMageWithColor:[UIColor colorWithRGBString:@"#ffffff"] size:CGSizeMake(22, 22)];
        [but setImage:backImage forState:UIControlStateNormal];
        [but setImage:backImage forState:UIControlStateHighlighted];
        but.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    }
    else
    {
        UIImage *image = [UIImage imageNamed:imageName];
        [but setImage:image forState:UIControlStateNormal];
        [but setImage:image forState:UIControlStateHighlighted];
        but.frame = CGRectMake(0, 0, 32, 32);
    }
    [but setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithCustomView:but];
    return barbutton;
}



/**
 * 返回导航条Item
 */
+ (UIBarButtonItem *)backBarButtonWithImageName:(NSString *)imageName imageEdgeInset:(UIEdgeInsets)edgeInset select:(SEL)select target:(id)target{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    if (!imageName) {
        UIImage *backImage = [self createBackIMageWithColor:[UIColor colorWithRGBString:@"#ffffff"] size:CGSizeMake(22, 22)];
        [but setImage:backImage forState:UIControlStateNormal];
        [but setImage:backImage forState:UIControlStateHighlighted];
        but.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    }
    else
    {
        UIImage *image = [UIImage imageNamed:imageName];
        [but setImage:image forState:UIControlStateNormal];
        [but setImage:image forState:UIControlStateHighlighted];
        but.frame = CGRectMake(0, 0, 32, 32);
    }
    [but setImageEdgeInsets:edgeInset];
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithCustomView:but];
    return barbutton;
}


/**
 *  绘制返回按钮
 */
+ (UIImage *)createBackIMageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 添加一个透明类型的Quartz 2D绘画环境（画布）,你可以在上面任意绘画
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, rect);
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(size.width/2, size.height/2 - 10)];
    [bezierPath addCurveToPoint: CGPointMake(size.width/2-10 , size.height/2) controlPoint1: CGPointMake(size.width/2-10 , size.height/2) controlPoint2: CGPointMake(size.width/2-10, size.height/2)];
    [UIColor.grayColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(size.width/2-10, size.height/2)];
    [bezier2Path addLineToPoint: CGPointMake(size.width/2, size.height/2 + 10)];
    [color setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

@end
