//
//  SearchViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "SearchViewController.h"
#import "HomeDetailViewController.h"
@interface SearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITextField *textField;
@property(nonatomic ,strong)UISearchBar *customSearchBar;
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *dataArray;




@end

@implementation SearchViewController

-(UITableView *)tableView
{

    if (!_tableView ) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

//
//-(NSMutableArray *)dataArray
//{
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray arrayWithObjects:@"Test Data", nil];
//    }
//    return _dataArray;
//}

-(void)viewWillAppear:(BOOL)animated
{
    
    [self.textField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self  createSearchView];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView  alloc]init ];
}


-(void)createSearchView
{
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, DEVICE_WIDTH - GMLAYOUTRATE(150), 30) ];
    self.textField.font =  font14;
    self.textField.placeholder = @"Please Entry your key";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor whiteColor];
    UIImageView *iconImageView = [[UIImageView alloc]init ];
    iconImageView.image = [UIImage imageNamed:@"search"];
    iconImageView.contentMode = UIViewContentModeCenter;
    iconImageView.size = CGSizeMake(30, 30);
    self.textField.leftView = iconImageView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.navigationItem.titleView = self.textField;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"test Data", nil];
    [self.tableView reloadData];
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.textField resignFirstResponder];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell" ];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeDetailViewController *hdvc = [[HomeDetailViewController alloc]init ];
    hdvc.news_Id = 0;
    [self pushVC:hdvc];
}



@end
