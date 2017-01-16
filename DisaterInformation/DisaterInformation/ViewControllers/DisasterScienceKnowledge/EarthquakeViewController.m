//
//  EarthquakeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/6.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "EarthquakeViewController.h"
#import "HomeDetailViewController.h"
typedef NS_ENUM(NSInteger,DisasterType){
    earthquake = 0,
    debrisFlow,
    flood
    
};

@interface EarthquakeViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    DisasterType  disasterType;
    
}



@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *dataArray;

@end

@implementation EarthquakeViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
    
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }

    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    if (self.disasterType == 0) {
     
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"Earthquake science knowledge",@"the cause of the earthquake" ,nil ];
    }else if (self.disasterType == 1){
    
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"How the debris flow is formed", nil ];

    }else{
//        _dataArray = [[NSMutableArray alloc]initWithObjects:@"暴雨时如何形成的",@"暴雨会造成什么样的后果",@"在遇到暴雨该如何避险", nil ];
    
    }
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init ];
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
    }

    return _dataArray;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" ];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeDetailViewController *hvc = [[HomeDetailViewController alloc]init ];
    if (self.disasterType == 0) {
        hvc.news_Id = indexPath.row + 1000;

    }else if (self.disasterType == 1){
       hvc.news_Id  = indexPath.row + 2000;
    }else{
        hvc.news_Id = indexPath.row + 10;
    }
    [self pushVC:hvc];
    
}





@end
