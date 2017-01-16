//
//  RiskDistributionViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "RiskDistributionViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
@interface RiskDistributionViewController ()<MAMapViewDelegate>
@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic ,strong)MAMapView *mapView;
@end

@implementation RiskDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self createWeb];
    
//    [ self createImageView];
    
    [self createMapView];
}


-(void)createMapView
{

    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds ];
    self.mapView.delegate = self;
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    //构造圆
    MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.952136, 116.50095) radius:5000];
    
    //在地图上添加圆
    [self.mapView addOverlay: circle];
    [self.view addSubview:self.mapView];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//    pointAnnotation.coordinate = CLLocationCoordinate2DMake(24.7499400000,90.4048570000); 迈门辛市
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.952136, 116.50095);
    pointAnnotation.title = @"Chaoyang District serious fog and haze area";
    pointAnnotation.subtitle = @"Baidu maps to the air quality index China weather network to provide real-time updates across the country (AQI), through the color will be different degree of pollution of the region clearly marked, divided into severe pollution, moderate pollution, light pollution, good and excellent five grades.";
    
    [_mapView addAnnotation:pointAnnotation];
}


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MACircle class]])
    {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        circleRenderer.lineWidth    = 5.f;
        circleRenderer.strokeColor  = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
        circleRenderer.fillColor    = [UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.8];
        return circleRenderer;
    }
    return nil;
}
//
//
//-(void)createWeb
//{
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds ];
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"disstance"
//                                                          ofType:@"html"];
//    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
//                                                    encoding:NSUTF8StringEncoding
//                                                       error:nil];
//    [webView loadHTMLString:htmlCont baseURL:baseURL];
//    webView.scrollView.showsVerticalScrollIndicator = NO;
//    webView.scrollView.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:webView];
//}
//



//-(void)createImageView
//{
//    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT - 64) ];
////    imageView.image = [UIImage imageNamed:@""];
//      self.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"risk_icon" ofType:@"png" ]];
////    imageView.contentMode = UIViewContentModeScaleAspectFill;
//      self.imageView.userInteractionEnabled = YES;
//    [self.view addSubview:  self.imageView];
//
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:) ];
//    [  self.imageView addGestureRecognizer:tap];
//}
//
//
//-(void)tapAction:(UITapGestureRecognizer *)tapgesture
//{
//
//    CGPoint point = [tapgesture locationInView:self.imageView];
////    MMLog(@"%f",point);
//    [self alter:nil];
//    
//
//}
//
//
//-(void)alter:(UIViewController *)vc
//{
//    if (self.imageView.origin.x == 147|| self.imageView.origin.y == 189.5) {
//        
//        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@" 孟加拉国属于亚热带季风气候，沿海属于季风型热带草原气候。河道纵横密布，河运发达，雨季极易泛滥，常出现热带飓风。矿藏有天然气、煤、钛、锆等，黄麻是孟加拉国主要的经济来源。 孟加拉国是全世界人口密度最高的人口大国及世界最贫穷国家之一。。" message:nil preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            [self.view endEditing:YES];
//        }];
//        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            [self.view endEditing:YES];
//        }];
//        [alert addAction:ok];
//        [alert addAction:cancel];
//        [self presentViewController:alert animated:YES completion:nil];
//        
//    }
//  
//}

@end
