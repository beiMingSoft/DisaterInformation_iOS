//
//  EvacuationSitesViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "EvacuationSitesViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface EvacuationSitesViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{


    MKMapView *_mapView;
    CLLocationManager *locationManager;
    CLLocation *location;

}
@end

@implementation EvacuationSitesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"downloadMap" select:@selector(downloadMapAction) target:self];
    [self createMapView];
}

-(void)downloadMapAction
{
    MMLog(@"下载地图");
}


-(void)createMapView
{
    _mapView = [[MKMapView alloc]initWithFrame:self.view.bounds ];
    _mapView.zoomEnabled = YES;
    _mapView.showsUserLocation = YES;
    _mapView.scrollEnabled = YES;
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    if([[UIDevice currentDevice].systemVersion floatValue] > 8.0f)
    {
        [self getUserLocation];
    }
    // 长按手势  长按添加大头针
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(lpgrClick:)];
    [_mapView addGestureRecognizer:lpgr];
}

//获取当前的位置
-(void)getUserLocation
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    //kCLLocationAccuracyBest:设备使用电池供电时候最高的精度
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.distanceFilter = 50.0f;
    if (([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0))
    {
        [locationManager requestAlwaysAuthorization];
    }
    //更新位置
      [locationManager startUpdatingLocation];
}

#pragma mark-CLLocationManagerDelegate  位置更新后的回调
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //停止位置更新
    [locationManager stopUpdatingLocation];
    
    CLLocation *loc = [locations firstObject];
    CLLocationCoordinate2D theCoordinate;
    //位置更新后的经纬度
    theCoordinate.latitude = loc.coordinate.latitude;
    theCoordinate.longitude = loc.coordinate.longitude;
    //设定显示范围
    MKCoordinateSpan theSpan;
    theSpan.latitudeDelta=0.01;
    theSpan.longitudeDelta=0.01;
    //设置地图显示的中心及范围
    MKCoordinateRegion theRegion;
    theRegion.center=theCoordinate;
    theRegion.span=theSpan;
    [_mapView setRegion:theRegion];
    location = [locations lastObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error)
     {
         CLGeocoder *geocoder = [[CLGeocoder alloc] init];
         [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error) {
             
             if (array.count > 0)
             {
                 CLPlacemark *placemark = [array objectAtIndex:0];
                 // 将获得的所有信息显示到label上
                 NSLog(@"%@",placemark.administrativeArea);
                 // 获取城市
                 NSString *city = placemark.administrativeArea;
                 if (!city) {
                     // 四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                     city = placemark.administrativeArea;
                 }
                 NSLog(@"当前城市:%@",city);
                 // 设置地图显示的类型及根据范围进行显示  安放大头针
                 MKPointAnnotation *pinAnnotation = [[MKPointAnnotation alloc] init];
                 pinAnnotation.coordinate = theCoordinate;
                 pinAnnotation.title = city;
                 [_mapView addAnnotation:pinAnnotation];
             }
             else if (error == nil && [array count] == 0)
             {
                 NSLog(@"No results were returned.");
             }
             else if (error != nil)
             {
                 NSLog(@"An error occurred = %@", error);
             }
             
             
         }];
         
     }];
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView * view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    //设置标注的图片
    view.image=[UIImage imageNamed:@"shelter"];
    //点击显示图详情视图 必须MJPointAnnotation对象设置了标题和副标题
    view.canShowCallout=YES;
    //创建了两个view
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view1.backgroundColor=[UIColor redColor];
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view2.backgroundColor=[UIColor blueColor];
    //设置左右辅助视图
    view.leftCalloutAccessoryView=view1;
//    view.rightCalloutAccessoryView=view2;
    //设置拖拽 可以通过点击不放进行拖拽
    view.draggable=YES;
        return view;
    
}


//长按添加大头针事件
- (void)lpgrClick:(UILongPressGestureRecognizer *)lpgr
{
    // 判断只在长按的起始点下落大头针
    if(lpgr.state == UIGestureRecognizerStateBegan)
    {
        // 首先获取点
        CGPoint point = [lpgr locationInView:_mapView];
        // 将一个点转化为经纬度坐标
        CLLocationCoordinate2D center = [_mapView convertPoint:point toCoordinateFromView:_mapView];
        MKPointAnnotation *pinAnnotation = [[MKPointAnnotation alloc] init];
        pinAnnotation.coordinate = center;
        pinAnnotation.title = @"避难所";
        [_mapView addAnnotation:pinAnnotation];
    }
}

//计算两个位置之间的距离
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
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
