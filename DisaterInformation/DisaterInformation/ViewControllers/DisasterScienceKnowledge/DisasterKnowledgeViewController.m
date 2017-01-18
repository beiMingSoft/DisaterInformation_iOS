//
//  DisasterKnowledgeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/6.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "DisasterKnowledgeViewController.h"
#import "KnowledgeCell.h"
#import "EarthquakeViewController.h"


static NSString *knowCell = @"knowledgeCell";

@interface DisasterKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UICollectionView *collectionView;
@property(nonatomic ,strong)NSMutableArray *dataArray;
@property(nonatomic ,strong)NSArray *images;
@property(nonatomic ,strong)UITableView *tableView;
@end

@implementation DisasterKnowledgeViewController
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;

}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"Earthquake",@"Debris Flow",@"Flood",@"Fire",@"Hurricane", nil ];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.images = @[@"equack_icon",@"debrisFlow_icon",@"flood_idcon",@"fir_icon",@"Hurricane_icon",];

    self.tableView.tableFooterView = [[UIView alloc]init ];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KnowledgeCell *  cell = [tableView dequeueReusableCellWithIdentifier:knowCell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KnowledgeCell" owner:self options:nil  ]lastObject ];
        
    }

    cell.mainTitleLabel.text = self.dataArray[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
               EarthquakeViewController *evc = [[EarthquakeViewController alloc]init ];
                evc.title = self.dataArray[indexPath.row];
                evc.disasterType = 0;
                [self pushVC:evc];
            }
            if (indexPath.row == 1) {
                EarthquakeViewController *evc = [[EarthquakeViewController alloc]init ];
                evc.title = self.dataArray[indexPath.row];
                evc.disasterType = 1;
                [self pushVC:evc];
            }
//            if (indexPath.row == 2) {
//                EarthquakeViewController *evc = [[EarthquakeViewController alloc]init ];
//                evc.title = self.dataArray[indexPath.row];
//                evc.disasterType = 2;
//                [self pushVC:evc];
//            }

}


@end
