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
@interface SelfHelpmutualGuideViewController ()<UITableViewDelegate,UITableViewDataSource,sendActionAndIndexDelegate>

@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;

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
    
    for (int i =0 ; i< 3; i++) {
        
        DisasterWarningModel * model = [[DisasterWarningModel alloc]init ];
        model.mainTitle = @"某城市通过预警公告已成功避免了灾害带来的最小损失与人员最小伤亡";
        model.time = @"10分钟";
        model.from = @"某城市灾难监测站";
        if (i == 0) {
            model.urlStr = @"comments";
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterWarningCell *cell = [tableView dequeueReusableCellWithIdentifier:@"warningCell"];
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterWarningCell" owner:self options:nil]lastObject];
    }
    
    [cell setModel:model];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(440)) ];
    //轮播图，广告页
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(180)) ];
    imageView.image = [UIImage imageNamed:@"disater"];
    [headView addSubview:imageView];
    
    NSArray *titleArr = @[@"地震",@"台风",@"海啸",@"火灾",@"泥石流",@"沙尘暴",@"龙卷风",@"更多"];
    NSArray *imageArr =@[@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel"];
    
    CustomHeaderView *chv = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), DEVICE_WIDTH, GMLAYOUTRATE(255)) city:nil cityName:nil imageArray:imageArr titleArray:titleArr spots:@"最新资讯" moreTitle:nil];
    chv.backgroundColor = [UIColor whiteColor];
    chv.delegate = self;
    [headView addSubview:chv];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GMLAYOUTRATE(440);
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    return model.cellHeight;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}



// 分类模块
-(void)buttonAndId:(NSInteger)index
{
    NSInteger tag = index - 1000;
    UIViewController *vc = nil;
    switch (tag) {
        case 0:// 灾害预警
            
            break;
        case 1://自救互助
            break;
        case 2:
            break;
        case 3://灾害科普
            
            
            break;
        case 4:
            
            break;
        case 5:
            break;
        case 6:
            
            break;
        case 7:
            
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)moreButtonClicked
{
    MMLog(@"查看更多");

}
@end
