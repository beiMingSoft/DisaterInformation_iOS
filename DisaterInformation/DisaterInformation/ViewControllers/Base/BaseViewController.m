//
//  BaseViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "BaseViewController.h"
#import "ToolObject.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [ToolObject backBarButtonWithImageName:@"nav_back" select:@selector(back) target:self];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSString *)updateTimeForRow:(NSString *)str
{
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
    NSTimeInterval createTime =[str floatValue];
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    
    //秒转分钟
    NSInteger small = time / 60;
    if (small == 0) {
        return [NSString stringWithFormat:@"刚刚"];
    }
    
    
    if (small < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",small];
    }
    
    // 秒转小时
    NSInteger hours = time/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
}


-(void)pushVC:(UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)popVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
