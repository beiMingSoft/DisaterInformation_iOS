//
//  EvacuationSitesViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "EvacuationSitesViewController.h"

@interface EvacuationSitesViewController ()

@end

@implementation EvacuationSitesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"避难场所";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createWeb];
}

-(void)createWeb
{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds ];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"PlaceOfRefuge"
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
