//
//  InformationViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/3.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "InformationViewController.h"
#import "InfoCell.h"


static NSString *InforCell = @"cellIde";

@interface InformationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView *tableView;
@end



@implementation InformationViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init ];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:InforCell];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"InfoCell" owner:self options:nil ]lastObject ];
    }
    cell.titleLabel.text = @"什么是热带风暴（Tropicalstorm）？";
    cell.descriptionLabel.text = @"热带风暴是所有自然灾害中最具破坏力的.每年飓风都从海洋横扫至内陆地区.强劲的风力和暴风雨过后留下的只是一片狼藉。";
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
