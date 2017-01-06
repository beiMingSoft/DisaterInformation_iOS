//
//  DisasterWarningDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/6.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "DisasterWarningDetailViewController.h"

@interface DisasterWarningDetailViewController ()
@property(nonatomic ,strong)NSArray *dataArray;
@end

@implementation DisasterWarningDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"预警公告详情";
    self.dataArray = @[@"    预计未来12小时我区将出现对交通有影响的道路结冰，并伴有积雪。",@"    防城港市气象台2016年12月29日8时30分继续发布大风蓝色预警信号：受冷空气影响，预计未来24小时内防城港市沿海及近海海面仍将出现5-6级，阵风7级的偏北大风，请注意防范。",@"     据云南地震台网测定：2016年11月，云南及周边地区（北纬20°～30°，东经96°～107°）共发生地震812次。按M统计，其中M0.0～0.9级615次、M1.0～1.9级171次、M2.0～2.9级20次、M3.0～3.9级3次、M4.0～4.9级3次，该区域最大地震和省内最大地震均为11月17日12时22分云南漾濞M4.4级地震。（注：M为国家标准震级"];
    [self createTextView];
}

-(void)createTextView
{
    UITextView *textView = [[UITextView alloc]initWithFrame:self.view.bounds ];
    textView.text = self.dataArray[self.news_ID];
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor colorWithRGBString:COLOR_BLACK_333333];
    [self.view addSubview:textView];
}

@end
