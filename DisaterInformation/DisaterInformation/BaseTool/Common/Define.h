//
//  Define.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/10.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#ifndef Define_h
#define Define_h



//
// 屏幕尺寸
//
#define DEVICE_BOUNDS [UIScreen mainScreen].bounds

#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width

#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height

// 判断IPHONE类型
// iPhone4
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height <= 480)
#define ShortSystemVersion  [[UIDevice currentDevice].systemVersion floatValue]


// 判别系统版本
#define IS_IOS_6 (ShortSystemVersion < 7)
#define IS_IOS_7 (ShortSystemVersion >= 7 && ShortSystemVersion < 8)
#define IS_IOS_8 (ShortSystemVersion >= 8)

// 判别设备类型
#define IS_PORTRAIT UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) || UIDeviceOrientationIsPortrait(self.interfaceOrientation)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


/*
*  适配缩放比例
*/
#define GMLAYOUTRATE(orginLayout) (CGFloat)(layoutRateByHeight(orginLayout))


//随机颜色
#define kCOLORRANDOM [UIColor colorWithRed:(arc4random() % 256)/255.f green:(arc4random() % 256)/255.f blue:(arc4random() % 256)/255.f alpha:1];




#pragma mark  定义颜色
#define COLOR_MAIN_BACKGOROUNDCOLOR     @"#F1F5F8"  //  背景颜色


#define COLOR_MAIN_BLUE_29A1EF          @"#29a1ef"  //  标准蓝 APP主色 button填充色
#define COLOR_MAIN_RED_F75258           @"#f75258"  //  button背景、报错文字、金额
#define COLOR_BLUE_2198E5               @"#2198e5"  //  辅助蓝  按钮按下状态
#define COLOR_RED_F2464D                @"#f2464d"  //  辅助红色 按钮按下状态
#define COLOR_YELLOW_FFB30A             @"#fe5722"  //  橘黄  状态字段（表等待） 提示图标
#define COLOR_GREEN_40AD36              @"#40ad36"  //  状态字段、提示图标
#define COLOR_BLACK_333333              @"#333333"  //  黑3  正文标题 选项名称等文字
#define COLOR_LIGHTGRAY_666666          @"#666666"  //  灰6 正文内容
#define COLOR_LIGHTGRAY_999999          @"#999999"  //  灰9 提示文字 选择箭头
#define COLOR_LIGHTGRAY_D8D9DD          @"#d8d9dd"  // button不可点击状态
#define COLOR_LIGHTGRAY_D5D5D5          @"#d5d5d5"  //  bar底部描边 button状态
#define CLOKR_LIGHTGRAY_E236E9          @"#e2e629"  //  蓝灰  分割线
#define COLOR_WHITE                     @"#ffffff"  //  纯白颜色
#define COLOR_MAIN_COLOR                @"#ff8212"  //  APP主色调
#define COLOR_YELLOW_FE5722                @"#ff5722"  //  APP主色调

//不羁旅行
#define COLOR_YELLOW_1A1A1A                @"#1A1A1A "  //  标题颜色
#define COLOR_YELLOW_7EBB15                @"#7EBB15 "  //  免费字体颜色
#define COLOR_LINEVIEW_F0F0F               @"F0F0F0"//分割线
#define COLOR_SPOTTITLE_111111             @"111111"
#define COLOR_646464                       @"#646464"//查看更多
#define COLOR_PRICELABEL_FF7200            @"FF7200"//价钱颜色
#define COLOR_PRICELABEL_7ebb15            @"#7ebb15"//免费
#define COLOR_PRICELABEL_D6D7DC           @"#D6D7DC"//tableview 背景颜色



#define font11 [UIFont systemFontOfSize:11]
#define font12 [UIFont systemFontOfSize:12]
#define font13 [UIFont systemFontOfSize:13]
#define font14 [UIFont systemFontOfSize:14]
#define font15 [UIFont systemFontOfSize:15]
#define font16 [UIFont systemFontOfSize:16]
#define font17 [UIFont systemFontOfSize:17]
#define font18 [UIFont systemFontOfSize:18]
#define font19 [UIFont systemFontOfSize:19]
#define font20 [UIFont systemFontOfSize:20]
#define font22 [UIFont systemFontOfSize:22]
#define font25 [UIFont systemFontOfSize:25]


//
// 调试模式
//
#ifdef DEBUG
#define MMLog( s, ... ) NSLog( @"L:%d [%@: - %@]  %@",__LINE__, [[NSString stringWithUTF8String:__FILE__] lastPathComponent],NSStringFromSelector(_cmd),  [NSString stringWithFormat:(s), ##__VA_ARGS__] );
#else
#define MMLog( s, ... );
#endif



#endif /* Define_h */
