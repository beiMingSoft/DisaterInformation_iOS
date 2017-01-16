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
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"downloadMap" select:@selector(downloadMapAction) target:self];
    
    [self createImageView];
    
//    [self createWeb];
}

-(void)downloadMapAction
{


    

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





-(void)createImageView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds ];
    imageView.image = [UIImage imageNamed:@"Evacuation_icon"];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:) ];
    [imageView addGestureRecognizer:tap];
}


-(void)tapAction:(UITapGestureRecognizer *)tapgesture
{
    
    
    [self alter:nil];
    
    
}


-(void)alter:(UIViewController *)vc
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"长青公园地震应急避难所　属于二类（2级场地），建设面积为55465平方米，可容纳37000人（按人均1.5平方米计算），可安置受助人员10~30天，服务半径为2公里，一般步行5-30分钟即可到达。是北海容纳人数最多的应急避难场所，集休闲公园、城市美化、紧急避难三大功能于一体。" message:@"广西省北海市" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.view endEditing:YES];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.view endEditing:YES];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}




@end
