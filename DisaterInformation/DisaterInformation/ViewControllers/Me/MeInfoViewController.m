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
#import "AboutUsViewController.h"
#import "FeedbackViewController.h"
#import "MyCollectionViewController.h"
#import "PasswordManagerViewController.h"

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
        _nameArray = @[@"News",@"Contacts",@"Collection",@"Password management",@"Feedback",@"AboutUs",@"Version"];
    }
    return _nameArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My Center";
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
        ivc.title = self.nameArray[indexPath.row];
        [self pushVC:ivc];
    }else if (indexPath.row == 2){
        MyCollectionViewController *mcvc = [[MyCollectionViewController alloc]init ];
        mcvc.title = self.nameArray[indexPath.row];

        [self pushVC:mcvc];
    }else if(indexPath.row == 3){
        PasswordManagerViewController *fvc = [[PasswordManagerViewController alloc]init ];
        fvc.title = self.nameArray[indexPath.row];
        [self pushVC:fvc];

    }else if(indexPath.row == 4){
        FeedbackViewController *fvc = [[FeedbackViewController alloc]init ];
        fvc.title = self.nameArray[indexPath.row];

        [self pushVC:fvc];
        
    }else if (indexPath.row == 5){
    
        AboutUsViewController *avc = [[AboutUsViewController alloc]init ];
        avc.title = self.nameArray[indexPath.row];

        [self pushVC:avc];
    }
    
    
    else{
    
        [self alter];
    
    }

}

-(void)alter
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Is the latest version" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.view endEditing:YES];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"UpDate" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.view endEditing:YES];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
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
