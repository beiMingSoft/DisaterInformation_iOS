//
//  RRZSendShowImageCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/13.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#define kShowImageCCell_Width floorf((DEVICE_WIDTH - 15*2- 10*3)/4)

#import "RRZSendShowImageCell.h"
#import "RRZShowEditImageCell.h"
#import "UICustomCollectionView.h"
#import "ShowEditItem.h"
static NSString *cellID = @"RRZShowImageCCellID";

@interface RRZSendShowImageCell()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (strong, nonatomic) UICustomCollectionView *mediaView;
@property (strong, nonatomic) NSMutableDictionary *imageViewsDict;
/** 注释*/
@property (strong, nonatomic) NSArray *imgs;
/** 注释*/
@property (weak, nonatomic) UIButton *deleteBtn;
@end

@implementation RRZSendShowImageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.height = 300;
        [self setupCollectionView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, DEVICE_WIDTH - 20, 1)];
        label.backgroundColor = [UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:1];
        [self.contentView addSubview:label];
    }
    return self;
}

-(void)setupCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init ];
    layout.itemSize = CGSizeMake(kShowImageCCell_Width, kShowImageCCell_Width);
    self.mediaView = [[UICustomCollectionView alloc]initWithFrame:CGRectMake(15, 10, DEVICE_WIDTH - 2 * 15, 280) collectionViewLayout:layout ];
    [self.mediaView  setBackgroundColor:[UIColor clearColor]];
    self.mediaView.scrollEnabled = NO;
    self.mediaView.dataSource = self;
    self.mediaView.delegate = self;
    [self.mediaView registerNib:[UINib nibWithNibName:NSStringFromClass([RRZShowEditImageCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
    [self.contentView addSubview:self.mediaView];
}

-(void)setItem:(ShowEditItem *)item
{
//    NSInteger num = item.selectedImages.count ? item.selectedImages.count :0;
//    [item.selectedImages insertObject:[UIImage imageNamed:@"拍照"] atIndex:num];
    _item = item;
    
    [self.mediaView reloadData];
}

#pragma mark - UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger num = self.item.selectedImages.count;
    return num < 9? num+ 1: num;
//    return  num;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RRZShowEditImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (indexPath.row < self.item.selectedImages.count) {
        cell.img.image = self.item.selectedImages[indexPath.row];
    }else{
        cell.img.image = [UIImage imageNamed:@"拍照"];
        cell.deleteBtn.hidden = YES;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.deleteBtn = cell.deleteBtn;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.item.selectedAssetURLs.count || indexPath.row == self.item.selectedImages.count) {
        if (_addPicturesBlock) {
            _addPicturesBlock();
        }
    }
}

-(void)deleteBtnClick:(UIButton *)btn{
    NSInteger index = btn.tag;
    [self.item.selectedImages removeObjectAtIndex:index];
    [self.item.selectedAssetURLs removeObjectAtIndex:index];
    if (_deleteImageBlock) {
        _deleteImageBlock(_item);
    }
}

























@end
