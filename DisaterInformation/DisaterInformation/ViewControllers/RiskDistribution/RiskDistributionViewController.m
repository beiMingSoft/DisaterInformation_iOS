//
//  RiskDistributionViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "RiskDistributionViewController.h"

@interface RiskDistributionViewController ()

@end

@implementation RiskDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"灾害风险分布";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createWeb];
    
}
-(void)createWeb
{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds ];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"disstance"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [webView loadHTMLString:htmlCont baseURL:baseURL];
    webView.scrollView.showsVerticalScrollIndicator = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:webView];
}





@end
