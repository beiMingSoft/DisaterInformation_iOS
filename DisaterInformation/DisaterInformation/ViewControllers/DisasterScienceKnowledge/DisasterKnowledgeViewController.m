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

@interface DisasterKnowledgeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic ,strong)UICollectionView *collectionView;
@property(nonatomic ,strong)NSMutableArray *dataArray;
@end

@implementation DisasterKnowledgeViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"地震",@"泥石流",@"洪水",@"火灾",@"台风", nil ];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"灾害科普知识";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init ];
    self.collectionView =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout ];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.showsVerticalScrollIndicator = NO;
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DisasterKnowledgeCell class]) bundle:nil] forCellWithReuseIdentifier:knowCell];
}




#pragma mark ---UICollectionViewDelegate,UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterKnowledgeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:knowCell forIndexPath:indexPath];
    cell.urlImageView.image = [UIImage imageNamed:@"home_btn_travel"];
    cell.nameLabel.text = self.dataArray[indexPath.row];
    
//    if (indexPath.row%2 == 0) {
//        cell.backgroundColor = [UIColor orangeColor];
//    }else{
//        cell.backgroundColor = [UIColor cy];
//    }
    return cell;
}





#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){(DEVICE_WIDTH - 3*15)/2,(DEVICE_WIDTH - 3*15)/2};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 0, 15);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.f;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){DEVICE_WIDTH,15};
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return (CGSize){DEVICE_WIDTH,15};
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

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
    if (indexPath.row == 2) {
        EarthquakeViewController *evc = [[EarthquakeViewController alloc]init ];
        evc.title = self.dataArray[indexPath.row];
        evc.disasterType = 2;
        [self pushVC:evc];
    }

}



@end
