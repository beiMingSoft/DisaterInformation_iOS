//
//  DisasterWarningDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/6.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "DisasterWarningDetailViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@interface DisasterWarningDetailViewController ()
@property(nonatomic ,strong)NSArray *dataArray;
@property(nonatomic ,strong) UIView *backView;
@end

@implementation DisasterWarningDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Details of Early Warning Notice";
    self.dataArray = @[@"The next 12 hours I will appear on the road influential traffic icing, accompanied by snow.",@"  Fangchenggang City Meteorological Station 2016 at 8:30 on December 29 to continue to release the wind blue warning signal: by the cold air, is expected within the next 24 hours Fangchenggang coastal and coastal sea will appear 5-6, gust 7 of the partial North wind, please pay attention to prevention。",@" According to the Yunnan Seismological Network measured: in 2016 November, Yunnan and the surrounding area (latitude 20 ° ~ 30 °, longitude 96 ° ~ 107 °) 812 times the total earthquake. According to M statistics, M0.0 ~ 0.9 615 times, M1.0 ~ 1.9 171, M2.0 ~ 2.9 20 times, M3.0 ~ 3.9 3 times, M4.0 ~ 4.9 3 times, The region's largest earthquake and the province's largest earthquake were at 12:22 on November 17, Yunnan Mikawa M4.4 earthquake. (Note: M is the national standard magnitude"];
    [self createTextView];
    
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"share_icon" select:@selector(shareAction) target:self];

    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)createTextView
{
    UIScrollView *backView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT - 64) ];
    [self.view addSubview:backView];
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, DEVICE_WIDTH - 20, 40)];
    titleLabel.font = font14;
    titleLabel.textColor = [UIColor colorWithRGBString:COLOR_BLACK_333333];
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:titleLabel];
    
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(backView.mas_top).offset(20);
//        make.left.equalTo(@20);
//        make.right.equalTo(backView.mas_right).offset(-10);
//        make.height.offset(40);
//        
//    }];
    //时间
    
    UILabel  *timeLabel = [[UILabel alloc]init ];
    timeLabel.frame = CGRectMake(10, CGRectGetMaxY(titleLabel.frame) + 10, 100, 16);
    timeLabel.text = @"7 days ago";
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.font = font12;
    timeLabel.textColor = [UIColor colorWithRGBString:COLOR_LIGHTGRAY_666666];
    [backView addSubview:timeLabel];
 
    //来源
    UILabel *fromLabel = [[UILabel alloc]init ];
    fromLabel.frame = CGRectMake(CGRectGetMaxX(timeLabel.frame), CGRectGetMaxY(titleLabel.frame) + 10, DEVICE_WIDTH - CGRectGetMinX(titleLabel.frame), 16);
    fromLabel.text = @"China Meteorological Administration website";
    fromLabel.textColor = [UIColor colorWithRGBString:COLOR_LIGHTGRAY_666666];
    fromLabel.font = font12;
    [backView addSubview:fromLabel];
    
//    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@20);
//        make.top.equalTo(titleLabel.mas_bottom).offset(10);
//        make.height.offset(16);
//        make.right.equalTo(fromLabel.mas_left).offset(-20);
//    }];
//    
//    
//    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@-20);
//        make.top.equalTo(titleLabel.mas_bottom).offset(10);
//        make.height.offset(16);
//        make.left.equalTo(timeLabel.mas_right).offset(20);
//    }];
    
    
    UIView *sqliteView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(timeLabel.frame) + 5, DEVICE_WIDTH, 1) ];
    sqliteView.backgroundColor = [UIColor colorWithRGBString:COLOR_LINEVIEW_F0F0F ];
    [backView addSubview:sqliteView];
    
    UIImageView *imageView = [[UIImageView alloc]init ];
    imageView.image = [UIImage imageNamed:@"guangxi_waring_icon"];
    [backView addSubview:imageView];


    if (self.picStr || self.picStr.length  != 0) {

        imageView.frame = CGRectMake(10, CGRectGetMaxY(sqliteView.frame) + 10, DEVICE_WIDTH -20, 150);
    }
    UITextView * textView;
    if (self.picStr) {
        textView = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), DEVICE_WIDTH, DEVICE_WIDTH) ];
    }else{
        textView = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sqliteView.frame), DEVICE_WIDTH, DEVICE_WIDTH) ];
    }

    textView.text = self.dataArray[self.news_ID];
    textView.editable = NO;
    textView.font = font14;
    textView.textColor = [UIColor colorWithRGBString:COLOR_BLACK_333333];
    [backView addSubview:textView];
    
    //首行缩进
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3;    //行间距
    //    paragraphStyle.maximumLineHeight = 60;   /**最大行高*/
    paragraphStyle.firstLineHeadIndent = 20;    /**首行缩进宽度*/
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:13],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
}


-(void)shareAction
{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"guangxi_waring_icon"]];
//    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"shareContent"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"shareTitle"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Successed"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
    
}




@end
