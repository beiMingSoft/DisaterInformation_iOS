//
//  HomeCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeModel;
@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *urlImageView;

@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIButton *browseButton;

@property (weak, nonatomic) IBOutlet UIButton *collectionButton;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;

-(void)setHomeModel:(HomeModel *)model;

@end
