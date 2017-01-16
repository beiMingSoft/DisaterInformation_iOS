//
//  MeInfoViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//
//个人中心

#import "MeInfoViewController.h"
#import "InformationViewController.h"
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
    self.title = @"个人中心";
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:meCellIde ];
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
    if (indexPath.row == 0) {
        InformationViewController * ivc = [[InformationViewController alloc]init ];
        [self.navigationController pushViewController:ivc animated:true];
        
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, GMLAYOUTRATE(130))];
    UIImageView *imageView = [[UIImageView alloc]init ];
    imageView.image = [UIImage imageNamed:@"UserImage"];
    imageView.frame = CGRectMake((DEVICE_WIDTH - 80)/2, 20, 80, 80);
    [headView addSubview:imageView];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageView.frame), CGRectGetMaxY(imageView.frame)+10, 120, 20) ];
    label.text = @"jame Xuezea";
    label.font = font14;
    [headView addSubview:label];
    return headView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GMLAYOUTRATE(150);
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - 130 - 7 *44) ];

    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [logoutButton setBackgroundColor:[UIColor colorWithRGBString:COLOR_009fe8 ]];
    [logoutButton setTitle:@"Sign Out" forState:UIControlStateNormal];
    logoutButton.frame = CGRectMake(30, 50, DEVICE_WIDTH - 60, 40);
    [logoutButton addTarget:self action:@selector(logoutAction:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:logoutButton];
    
    
    return footView;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return DEVICE_HEIGHT - 130 - 7 *44;

}

-(void)logoutAction:(UIButton *)btn
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
