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
    [self.view addSubview:self.tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
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
    cell.titleLabel.text = @"What is a tropical storm（Tropicalstorm）？";
    cell.descriptionLabel.text = @"Tropical storms are the most devastating of all natural disasters, and every year the hurricane sweeps from the ocean to the interior, where strong winds and storms leave behind only a mess.。";
    cell.timeLabel.text = [self updateTimeForRow:@"1483493403"];
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
