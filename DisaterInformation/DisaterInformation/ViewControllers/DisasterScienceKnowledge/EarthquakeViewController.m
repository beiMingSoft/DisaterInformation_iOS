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
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"地震小知识",@"地震逃生技巧",@"地震自救互救", nil ];
    }else if (self.disasterType == 1){
    
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"滑坡、泥石流、崩塌的防范1",@"滑坡、泥石流、崩塌的防范2", nil ];

    }else{
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"暴雨洪涝的防范1",@"暴雨洪涝的防范2",@"冰凌洪水、山洪的防范", nil ];
    
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

    HomeDetailViewController *hvc = [[HomeDetailViewController alloc]init ];
    if (self.disasterType == 0) {
        hvc.news_Id = indexPath.row;

    }else if (self.disasterType == 1){
       hvc.news_Id  = indexPath.row + 20;
    }else{
        hvc.news_Id = indexPath.row + 10;
    
    }
    [self pushVC:hvc];
    
}





@end
