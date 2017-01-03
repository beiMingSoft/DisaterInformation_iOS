//
//  HomeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomHeaderView.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "MoreInformationViewController.h"
#import "DisasterWarningViewController.h"
#import "SelfHelpmutualGuideViewController.h"
#import "DisasterScienceKnowledgeViewController.h"
#import "RiskDistributionViewController.h"
#import "RestorationAndReconstructionVC.h"
#import "EvacuationSitesViewController.h"
#import "DisasterReliefMaterialInquiryViewController.h"
#import "VolunteerInquiriesViewController.h"
#import "MTSearchBar.h"
#import "ToolObject.h"
#import "MeInfoViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,sendActionAndIndexDelegate>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;
@end

@implementation HomeViewController

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
    
    self.navigationItem.titleView = [MTSearchBar searchBar];
    //设置左导航按钮
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"main_me_icon_unselected" select:@selector(backButtonClick) target:self];
    
    [self createData];
    [self.view addSubview:self.tableView];
}

//z制造假数据
-(void)createData{

    for (int i =0 ; i< 10; i++) {
        HomeModel *model = [[HomeModel alloc]init ];
        model.mainTitle = @"地震灾害的由来";
        model.descriptionTitle = @"地震时如何产生的，地震的形成过程是什么";
        model.browseNumber = 111;
        model.collectionNumber = 111;
        model.likeNumber = 111;
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
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIde"];
    HomeModel *model = self.homeDataArray[indexPath.row];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:self options:nil]lastObject];
    }

    [cell setHomeModel:model];
    
    return cell;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(440)) ];
    //轮播图，广告页
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(180)) ];
    imageView.image = [UIImage imageNamed:@"disater"];
    [headView addSubview:imageView];
    
    NSArray *titleArr = @[@"灾害预警",@"自救互助",@"灾害科普",@"灾害风险",@"恢复重建",@"避难场所",@"救灾物质查询",@"志愿者查询"];
    NSArray *imageArr =@[@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel"];
    
    CustomHeaderView *chv = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), DEVICE_WIDTH, GMLAYOUTRATE(255)) city:nil cityName:nil imageArray:imageArr titleArray:titleArr spots:@"自然灾害" moreTitle:@"查看更多"];
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
    return  GMLAYOUTRATE(100);
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
            vc = [[DisasterWarningViewController alloc]init];
            
            break;
        case 1://自救互助
            vc = [[SelfHelpmutualGuideViewController alloc]init ];
            
            break;
        case 2://灾害科普
            vc = [[DisasterScienceKnowledgeViewController alloc]init ];
            
            break;
        case 3: //风险分布
            vc = [[RiskDistributionViewController alloc]init ];
            
            break;
        case 4:// 恢复重建指南
        
            vc = [[RestorationAndReconstructionVC alloc]init ];
            break;
        case 5://避难场所
            vc = [[EvacuationSitesViewController alloc]init ];

            break;
        case 6://救灾物资查询
            
            vc = [[DisasterReliefMaterialInquiryViewController alloc]init ];
            break;
        case 7://志愿者
            vc = [[VolunteerInquiriesViewController alloc]init ];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)backButtonClick
{
    MeInfoViewController *mifvc  = [[MeInfoViewController alloc]init ];
    [self.navigationController pushViewController:mifvc animated:YES];
}

//查看更多资讯
-(void)moreButtonClicked
{
    MoreInformationViewController *mfvc = [[MoreInformationViewController alloc]init ];
    [self.navigationController pushViewController:mfvc animated:YES];
}



@end
