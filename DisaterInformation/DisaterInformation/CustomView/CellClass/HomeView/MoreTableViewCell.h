//
//  MoreTableViewCell.h
//  Disaster information
//
//  Created by ya Liu on 2016/11/23.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InformationModel;
@interface MoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *urlImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *browerLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *forwardLabel;


-(void)setInformationModel:(InformationModel *)model;
@end
