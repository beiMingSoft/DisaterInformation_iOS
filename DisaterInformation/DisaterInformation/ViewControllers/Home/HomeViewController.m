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
#import "HomeDetailViewController.h"
#import "DisasterKnowledgeViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,sendActionAndIndexDelegate,UITextFieldDelegate>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;
@property(nonatomic ,strong)UITextField *textField;
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
//    [self createSearchView];
    self.title = @"灾害信息服务";
    
    //设置左导航按钮
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"main_me_icon_unselected" select:@selector(backButtonClick) target:self];
    
    [self createData];
    [self.view addSubview:self.tableView];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
}

-(void)createSearchView
{
     self.textField.size = CGSizeMake(GMLAYOUTRATE(DEVICE_WIDTH - 80), 30);
     self.textField.font =  font14;
     self.textField.backgroundColor = [UIColor redColor];
     self.textField.placeholder = @"请输入搜索关键字";
     self.textField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *iconImageView = [[UIImageView alloc]init ];
    iconImageView.image = [UIImage imageNamed:@"search"];
    iconImageView.contentMode = UIViewContentModeCenter;
    iconImageView.size = CGSizeMake(30, 30);
     self.textField.leftView = iconImageView;
     self.textField.leftViewMode = UITextFieldViewModeAlways;
     self.textField.layer.cornerRadius = 15;
     self.textField.layer.masksToBounds = YES;
     self.textField.delegate = self;
     self.textField.returnKeyType = UIReturnKeyDone;
     self.navigationItem.titleView = self.textField;
}

//制造假数据
-(void)createData{

    for (int i =0 ; i< 3; i++) {
        HomeModel *model = [[HomeModel alloc]init ];
        if (i == 0) {
            model.mainTitle = @"地震小知识";
            model.descriptionTitle = @"地震时如何产生的，地震的形成过程是什么";
        }else if (i == 1){
            model.mainTitle = @"地震逃生技巧";
            model.descriptionTitle = @"在地震来临时，我们如何保护好自己";
        }else{
            model.mainTitle = @"地震自救互助";
            model.descriptionTitle = @"地震发生时我们如何自救和帮助他人";
        }
        model.news_id = i;
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
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(370)) ];
    //轮播图，广告页
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(150)) ];
    imageView.image = [UIImage imageNamed:@"disater"];
    [headView addSubview:imageView];
    
    NSArray *titleArr = @[@"灾害预警",@"自救互助",@"灾害科普",@"灾害风险",@"恢复重建",@"避难场所",@"救灾物质",@"志愿者查询"];
    NSArray *imageArr =@[@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel"];
    
    CustomHeaderView *chv = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), DEVICE_WIDTH, GMLAYOUTRATE(220)) city:nil cityName:nil imageArray:imageArr titleArray:titleArr spots:@"自然灾害" moreTitle:@"查看更多" ColCount:4];
    chv.backgroundColor = [UIColor whiteColor];
    chv.delegate = self;
    [headView addSubview:chv];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GMLAYOUTRATE(370);
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  GMLAYOUTRATE(100);

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTSearchBar *search = [[MTSearchBar alloc]init ];
    search.delegate = self;
    [search resignFirstResponder];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeModel *model = self.homeDataArray[indexPath.row];
    HomeDetailViewController *hvc = [[HomeDetailViewController alloc]init ];
    hvc.news_Id = model.news_id;
    hvc.title = model.mainTitle;
    [self.navigationController pushViewController:hvc animated:YES];
    
}


// 分类模块
-(void)buttonAndId:(NSInteger)index
{
    
    MTSearchBar *search = [[MTSearchBar alloc]init ];
    search.delegate = self;
    [search resignFirstResponder];
    
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
//            vc = [[DisasterScienceKnowledgeViewController alloc]init ];
            vc = [[DisasterKnowledgeViewController alloc]init ];

            
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
