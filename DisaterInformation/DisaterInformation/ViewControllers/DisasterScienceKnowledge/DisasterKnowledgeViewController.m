//
//  DisasterKnowledgeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/6.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "DisasterKnowledgeViewController.h"
#import "DisasterKnowledgeCell.h"
#import "EarthquakeViewController.h"
static NSString *knowCell = @"knowledgeCell";

@interface DisasterKnowledgeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
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
    //    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init ];
//    self.collectionView =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout ];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
//    self.collectionView.dataSource = self;
//    self.collectionView.delegate = self;
//    [self.view addSubview:self.collectionView];
//    self.collectionView.showsVerticalScrollIndicator = NO;
//    //注册cell
//    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DisasterKnowledgeCell class]) bundle:nil] forCellWithReuseIdentifier:knowCell];
    [self.view addSubview:self.tableView];
    self.images = @[@"equack_icon",@"debrisFlow_icon",@"flood_idcon",@"fir_icon",@"Hurricane_icon",];

    self.tableView.tableFooterView = [[UIView alloc]init ];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return 50;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.images.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIde"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIde" ];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

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
