//
//  PasswordManagerViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "PasswordManagerViewController.h"
#import "ForgetPwdViewController.h"
#import "ChangePasswordViewController.h"

@interface PasswordManagerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *dataArray;
@end


@implementation PasswordManagerViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray  = [NSMutableArray arrayWithObjects:@"Find the password",@"Change Password", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init ];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" ];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        ForgetPwdViewController *fvc = [[ForgetPwdViewController alloc]init ];
        fvc.title = self.dataArray[indexPath.row];
        [self pushVC:fvc];
    }else{
        ChangePasswordViewController *fvc = [[ChangePasswordViewController alloc]init ];
        fvc.title = self.dataArray[indexPath.row];
        [self pushVC:fvc];
    
    }
    
    
}




@end
