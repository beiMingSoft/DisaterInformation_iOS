//
//  OperationTableVC.m
//  移动采编
//
//  Created by Apple on 15/7/3.
//  Copyright (c) 2015年 newgen. All rights reserved.
//

#import "OperationTableVC.h"
#import "BaseTableViewController.h"

@interface OperationTableVC ()
{
    NSMutableArray *_dataArray;
}

@end

@implementation OperationTableVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
//    self.dataSource=[[NSMutableArray alloc]init ];
//    for (int  i = 0; i < 5 ; i++) {
//        [self.dataSource addObject:[NSString stringWithFormat:@"存储点 %d号",i]];
//    }
    self.tableView.tableFooterView = [[UIView alloc]init ];
    
}

//-(void)resetTableView{
//    self.dataSource = [[NSMutableArray alloc]init ];
//    [self.tableView reloadData];
//}
//
//-(void)downloadData{
//
//    
//  
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"operation";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text=_dataSource[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NewsModel *model=_dataSource[indexPath.row];
//    self.operationBlock(model.Id);
//    self.operationTextBlock(model.title);
    self.sendArray(_dataArray);
    
}

@end
