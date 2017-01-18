//
//  MyCollectionViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "CollectionCell.h"
#import "EarthquakeViewController.h"
static NSString *cellIde = @"cell";
@interface MyCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *tableView;
@end

@implementation MyCollectionViewController


-(UITableView *)tableView
{
    if (!_tableView ) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView .delegate = self;
        _tableView.dataSource = self;
    
    }

    return _tableView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CollectionCell" owner:self options:nil]lastObject ];
    }
    cell.timeLabel.text = @"19 hours ago";
    cell.collectionTitle.text = @"Earthquake science knowledge";
    cell.contenType.text = @"Knowledge";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 90;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EarthquakeViewController *evc = [[EarthquakeViewController alloc]init ];
    evc.title = @"Detail";
    evc.disasterType = 0;
    [self pushVC:evc];

}


@end
