//
//  DisasterScienceKnowledgeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterScienceKnowledgeViewController.h"
#import "DisasterFirstCell.h"
#import "DisasterModel.h"
#import "SecondImageviewCell.h"
#import "CustomHeaderView.h"

static NSString *cellIde = @"cell";
static NSString *secondIde = @"Scell";

@interface DisasterScienceKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource,sendActionAndIndexDelegate>

@property(nonatomic ,strong)UITableView *tableView;

@property(nonatomic ,strong)NSMutableArray *titleArray;



@end

@implementation DisasterScienceKnowledgeViewController


-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init ];
    }
    return _dataArray;
    
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createData];
    self.title = @"灾害科普知识";
    self.titleArray = [NSMutableArray arrayWithObjects:@"地震",@"台风",@"海啸",@"火灾",@"泥石流",@"沙尘暴",@"龙卷风",@"更多",nil];
    
    self.imageArr = [NSMutableArray arrayWithObjects:@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel",@"home_btn_travel", nil];
    
    [self.view addSubview:self.tableView];
}

//制作假数据
-(void)createData
{
    for (int  i = 0; i< 3; i++) {
        DisasterModel *model = [[DisasterModel alloc]init ];
        model.text = @"自然灾害的定义";
        model.time = @"23分钟";
        model.from= @"凤凰网";
        [self.dataArray  addObject:model];
    }
    
}



#pragma mark ----UITableViewDelegate,UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        DisasterModel *model = self.dataArray [indexPath.row];
        DisasterFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
        if (cell == nil) {
            cell = [[DisasterFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde ];
        }
        [cell setDisaterModel:model];
        
        return cell;
    }else{
        DisasterModel *model = self.dataArray [indexPath.row];
        SecondImageviewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
        if (cell == nil) {
            cell = [[SecondImageviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde ];
        }
        [cell setDisaterModel:model];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GMLAYOUTRATE(250);
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return GMLAYOUTRATE(180);
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(250)) ];
    CustomHeaderView *chv = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(250)) city:nil cityName:nil imageArray:self.imageArr titleArray:self.titleArray spots:@"自然灾害" moreTitle:nil ];
    chv.backgroundColor = [UIColor whiteColor];
    chv.delegate = self;
    [headView addSubview:chv];
    return headView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击事件");
    
}

//分类点击事件
-(void)buttonAndId:(NSInteger)index
{
    
    UIViewController *vc = nil;
    NSInteger tag =  index - 1000;
    
}




@end
