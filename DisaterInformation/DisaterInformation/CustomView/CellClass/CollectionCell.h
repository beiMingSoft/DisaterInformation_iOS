//
//  CollectionCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/17.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *urlImageView;
@property (weak, nonatomic) IBOutlet UILabel *collectionTitle;
@property (weak, nonatomic) IBOutlet UILabel *contenType;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
