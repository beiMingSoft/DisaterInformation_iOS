//
//  VolunteerInDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/25.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "VolunteerInDetailViewController.h"

@interface VolunteerInDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSArray *nameArr;
@property(nonatomic ,strong)NSMutableArray *dataArr;
@end

@implementation VolunteerInDetailViewController

-(NSArray *)nameArr
{
    if (!_nameArr) {
        _nameArr = [[NSArray alloc]init ];
    }
    return _nameArr;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init ];
    }
    return _dataArr;
}



-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT - 64) style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }

    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self createData];
    self.tableView.tableFooterView = [[UIView alloc]init ];
}

-(void)createData
{
    self.nameArr = @[@"姓名",@"性别",@"籍贯",@"住址",@"电话",@"个人技能"];
    NSArray *arr = @[@"王二",@"男",@"中国",@"北京市海淀区中关村软件园",@"18210014321",@"医生，户外攀险"];
    [self.dataArr  addObjectsFromArray:arr];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIde"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellIde" ];
    }
    cell.textLabel.text = self.nameArr[indexPath.row];
    cell.detailTextLabel.text = self.dataArr[indexPath.row];
    return cell;
}





@end
