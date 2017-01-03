//
//  MeInfoViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//
//个人中心

#import "MeInfoViewController.h"
static NSString *meCellIde = @"meCell";

@interface MeInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSArray *nameArray;
@end

@implementation MeInfoViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(NSArray *)nameArray
{
    if (!_nameArray) {
        _nameArray = @[@"消息",@"通讯录",@"我的收藏",@"密码安全与管理",@"意见反馈",@"关于我们",@"版本更新"];
    }
    return _nameArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:meCellIde];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:meCellIde ];
    }
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == self.nameArray.count - 1){
    
    cell.detailTextLabel.text = @"v1.0";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(150))];
    headView.backgroundColor = [UIColor orangeColor];
    return headView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GMLAYOUTRATE(150);
}



@end
