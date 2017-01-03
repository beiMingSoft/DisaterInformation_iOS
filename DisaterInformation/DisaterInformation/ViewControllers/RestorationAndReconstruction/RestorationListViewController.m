//
//  RestorationListViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/21.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "RestorationListViewController.h"
#import "ZJScrollPageViewDelegate.h"
#import "TestCell.h"
@interface RestorationListViewController ()<ZJScrollPageViewChildVcDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *baseTableView;
@property (nonatomic, assign) NSInteger index;
@property(nonatomic ,strong)NSMutableArray *dataArray;

@end

@implementation RestorationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _baseTableView.delegate = self;
    _baseTableView.dataSource = self;
    [_baseTableView registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellReuseIdentifier:@"TestCell"];
    [self.view addSubview:_baseTableView];
    self.baseTableView.tableFooterView = [[UIView alloc]init ];
    [self createData];
}
-(void)createData
{
    _dataArray = [[NSMutableArray alloc]init ];
 
    [_dataArray addObject:@"陕西省人民政府办公厅关于印发山西省气象灾害应急预案的通知"];
    [_dataArray addObject:@"自然灾害救助条例"];
    [_dataArray  addObject:@"安徽省自然灾害救助办法"];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];
    NSString *str = @"一、人民防空警报规定国家规定的人民防空警报声有三种，借以分类指导人民群众的防空行动。此外，还有些省市规定了灾害警报。国家要求警报声响在一般噪音背景下要达到100%覆盖率，并要随城市的发展而发展。所有报警器都要保证100%的鸣响率。居民必须熟悉警报，能迅速判断警报并立即响应、行动。";
//    CGSize size = [str boundingRectWithSize:CGSizeMake(DEVICE_WIDTH - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    cell.maintitlelabel.text = self.dataArray[indexPath.row];
    return cell;
}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 100;
//
//}

- (void)setUpWhenViewWillAppearForTitle:(NSString *)title forIndex:(NSInteger)index firstTimeAppear:(BOOL)isFirstTime {
    if (isFirstTime) {
        NSLog(@"第%ld个", (long)index);
        _index = index;
        [self.baseTableView reloadData];
        // 可以做自己想操作的，比如网络请求
    }
}

@end
