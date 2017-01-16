//
//  RRZSendShowImageCell.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/13.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShowEditItem;
@interface RRZSendShowImageCell : UITableViewCell
@property (copy, nonatomic) void (^addPicturesBlock)();
@property (copy, nonatomic) void (^deleteImageBlock)(ShowEditItem *toDelete);
@property (nonatomic,strong) ShowEditItem *item;

@end
