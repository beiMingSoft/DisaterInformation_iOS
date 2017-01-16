//
//  SelfHelpmutualGuideViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "SelfHelpmutualGuideViewController.h"
#import "CustomHeaderView.h"
#import "DisasterWarningCell.h"
#import "DisasterWarningModel.h"
#import "HomeDetailViewController.h"
@interface SelfHelpmutualGuideViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;
@property(nonatomic ,strong)NSArray *secontionTitles;


@end

@implementation SelfHelpmutualGuideViewController


-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

-(NSMutableArray *)homeDataArray
{
    if (!_homeDataArray) {
        _homeDataArray = [[NSMutableArray alloc]init ];
    }
    return _homeDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0f;
}

//z制造假数据
-(void)createData{
    
    self.secontionTitles = [[NSArray alloc]init ];

    self.secontionTitles = @[@"EARTHQUAKE",@"FLOOD",@"LANDSLIDE",@"TYPHOON",@"FIRE",@"OTHERS"];
    NSArray *array1 = @[@"Earthquake escape techniques",@"Earthquake rescue themselves"];
    NSArray *array2 = @[@"Precaution against floods"];
    NSArray *array3 = @[@"Landslides, debris flow, collapse prevention"];
    NSArray *array4 = @[@"Prevention of typhoons and storm surges"];
    NSArray *array5 = @[@"Family Fire Escape",];
    NSArray *array6 = @[@"Rescue heart patients",@"Artificial respiration"];
    [self.homeDataArray addObject:array1];
    [self.homeDataArray addObject:array2];
    [self.homeDataArray addObject:array3];
    [self.homeDataArray addObject:array4];
    [self.homeDataArray addObject:array5];
    [self.homeDataArray addObject:array6];
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.homeDataArray[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.secontionTitles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterWarningCell *cell = [tableView dequeueReusableCellWithIdentifier:@"warningCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterWarningCell" owner:self options:nil]lastObject];
    }

    cell.mainTitleLabel.text = self.homeDataArray[indexPath.section][indexPath.row];
    cell.timeLabel.text = @"10 minutes";
    cell.fromLabel.text = @"National Disaster Relief Network";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    


    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return self.secontionTitles[section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeDetailViewController *hvc = [[HomeDetailViewController alloc]init ];
    hvc.news_Id =  indexPath.section * 10 +indexPath.row;;
    hvc.title = self.homeDataArray[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:hvc animated:YES];
}

@end
