//
//  DisasterReliefMaterialInquiryViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterReliefMaterialInquiryViewController.h"
#import "DisasterReliefMaterialInquiryCell.h"
#import "ReliefMaterialModel.h"
static NSString *relief = @"reliefCell";

@interface DisasterReliefMaterialInquiryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *ReliefDataArray;
@end

@implementation DisasterReliefMaterialInquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"救灾物资查询";
    [self createData];
    [self.view addSubview:self.tableView];

}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

-(NSMutableArray *)ReliefDataArray
{
    if (!_ReliefDataArray) {
        _ReliefDataArray = [[NSMutableArray alloc]init ];
    }
    return _ReliefDataArray;
}


//z制造假数据
-(void)createData{
    
    for (int i =0 ; i< 13; i++) {
        
        ReliefMaterialModel * model = [[ReliefMaterialModel alloc]init ];
        model.MaterialsName = @"药物";
        model.urlImage = @"comments";
        model.MaterialsNumbers = 9333;
        model.MaterialsAddress = @"4号存储点";
        model.CheckTime = @"2016-12-23";
        [self.ReliefDataArray addObject:model];
    }
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.ReliefDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterReliefMaterialInquiryCell *cell = [tableView dequeueReusableCellWithIdentifier:relief];
    ReliefMaterialModel *model =self.ReliefDataArray [indexPath.row];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterReliefMaterialInquiryCell" owner:self options:nil]lastObject];
    }
    [cell setModel:model];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return  0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}





@end
