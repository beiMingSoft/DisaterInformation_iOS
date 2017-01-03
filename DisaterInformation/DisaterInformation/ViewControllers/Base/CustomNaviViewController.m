//
//  CustomNaviViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "CustomNaviViewController.h"

@interface CustomNaviViewController ()

@end

@implementation CustomNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.09f green:0.60f blue:0.83f alpha:1.00f]];
    
    /**
     *  设置导航栏字体颜色
     */
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationBar setTitleTextAttributes:attriBute];

}



@end
