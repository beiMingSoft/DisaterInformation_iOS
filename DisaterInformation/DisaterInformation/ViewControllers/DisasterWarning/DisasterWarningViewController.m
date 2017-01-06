//
//  DisasterWarningViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterWarningViewController.h"
#import "CustomHeaderView.h"
#import "DisasterWarningCell.h"
#import "DisasterWarningModel.h"
#import "DisasterWarningDetailViewController.h"
@interface DisasterWarningViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;

@end

@implementation DisasterWarningViewController


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
    self.title = @"预警公告";
}

//z制造假数据
-(void)createData{
    
    for (int i =0 ; i< 3; i++) {
       
        DisasterWarningModel * model = [[DisasterWarningModel alloc]init ];
        if (i == 0 ){
            model.mainTitle = @"白云鄂博矿区气象局发布道路结冰黄色预警[III级/较大]";
            model.time = @"1483632000";
            model.from = @"白云鄂博矿区气象局";
            model.news_Id = i;
        }else  if( i == 1){
            model.mainTitle = @"广西防城港市发布大风蓝色预警";
            model.time = @"1482972540";
            model.from = @"中国气象局网站";
            model.news_Id = i;

        }else {
//            model.urlStr = @"disater";
//            model.isPic = YES;
            model.time = @"1451868540";
            model.mainTitle = @"2017年1月云南及周边地震活动概况";
            model.from = @"地震监测中心";
            model.news_Id = i;


        }
        [self.homeDataArray addObject:model];
    }
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.homeDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterWarningCell *cell = [tableView dequeueReusableCellWithIdentifier:@"warningCell"];
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterWarningCell" owner:self options:nil]lastObject];
    }
    cell.timeLabel.text = [self updateTimeForRow:model.time];

    [cell setModel:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

//    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
//    return model.cellHeight;
    
    return 80;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    DisasterWarningDetailViewController *wdvc = [[DisasterWarningDetailViewController alloc]init ];
    wdvc.news_ID = model.news_Id;
    [self pushVC:wdvc];
}

@end
