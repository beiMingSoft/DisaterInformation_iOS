//
//  AboutUsViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTextView];
}
-(void)createTextView
{
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - 64) ];
    textView.text  = @"Ministry of Civil Affairs National Disaster Reduction Center was established in April 2002, May 2003 the official operation, in February 2009 plus hanging Ministry of Civil Affairs Satellite Disaster Reduction Application Center brand. The center is mainly responsible for information management, disaster and risk assessment, products and services, space science and technology applications, science and technology and policy and regulations research, technical equipment and disaster relief materials research and development, publicity and education training and international cooperation and exchange. Work to provide information services, technical support and decision-making advice.";

    
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
    
    [self.view addSubview:textView];
}


@end
