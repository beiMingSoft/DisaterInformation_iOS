//
//  OperationTableVC.h
//  移动采编
//
//  Created by Apple on 15/7/3.
//  Copyright (c) 2015年 newgen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperationTableVC : UITableViewController

@property (nonatomic, copy) void (^operationBlock)(NSInteger tag);
@property (nonatomic, copy) void (^operationTextBlock)(NSString * name);

//@property(nonatomic,copy) void (^sendtcName)(NSString *tc,NSInteger row);
@property (nonatomic,copy) void(^sendArray)(NSMutableArray *arr);


@property (nonatomic, assign) NSInteger Btntag;
@property(nonatomic,strong)NSMutableArray *dataSource;


//-(void)downloadData;
//-(void)resetTableView;
@end
