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
@property(nonatomic ,strong)NSMutableArray *secontionTitles;

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
    self.title = @"自救互助指南";
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0f;
}

//z制造假数据
-(void)createData{
    
    self.secontionTitles = [[NSMutableArray alloc]init ];

    for (int i =0 ; i< 3; i++) {
        [self.secontionTitles addObject:@"台风"];
        DisasterWarningModel * model = [[DisasterWarningModel alloc]init ];
        model.mainTitle = @"地震逃生技巧";
        model.time = @"10分钟";
        model.from = @"国家减灾救灾网";
        if (i == 0) {
            model.urlStr = @"disater";
            model.isPic = YES;
        }
        [self.homeDataArray addObject:model];
    }
    
    
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.homeDataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.secontionTitles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterWarningCell *cell = [tableView dequeueReusableCellWithIdentifier:@"warningCell"];
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterWarningCell" owner:self options:nil]lastObject];
    }
    cell.timeLabel.text =  model.time ;

    [cell setModel:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    return model.cellHeight;
    
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
    hvc.news_Id = 1;
    [self.navigationController pushViewController:hvc animated:YES];

}

@end
