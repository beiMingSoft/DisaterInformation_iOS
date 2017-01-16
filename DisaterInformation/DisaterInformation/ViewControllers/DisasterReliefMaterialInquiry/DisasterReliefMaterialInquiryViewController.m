//
//  DisasterReliefMaterialInquiryViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterReliefMaterialInquiryViewController.h"
#import "DisasterReliefMaterialInquiryCell.h"
#import "ReliefMaterialModel.h"
#import "LSSwitchTitleView.h"
#import "OperationTableVC.h"
#import "SearchViewController.h"
static NSString *relief = @"reliefCell";

@interface DisasterReliefMaterialInquiryViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    BOOL isType;// 是否按存储点查询
}
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *ReliefDataArray;
@property(nonatomic ,strong)OperationTableVC *operationTabVC;
@property(nonatomic ,strong) UIView *operationView;
@property(nonatomic ,strong) NSMutableArray *ListArray;
@property(nonatomic ,strong)NSMutableArray *itemsCategorys;//物品种类
@property(nonatomic ,strong)NSMutableArray *StoragePoints;//储存点

@property (nonatomic, assign) BOOL isHidden;


@end

@implementation DisasterReliefMaterialInquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"search_icon" select:@selector(searchAction) target:self];
    [self createHeadView];
    isType = YES;
    [self.view addSubview:self.tableView];

}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

-(NSMutableArray *)ReliefDataArray
{
    if (!_ReliefDataArray) {
        _ReliefDataArray = [[NSMutableArray alloc]init ];
    }
    return _ReliefDataArray;
}


-(void)searchAction
{
    SearchViewController *svc = [[SearchViewController alloc]init ];
    [self.navigationController pushViewController:svc animated:YES];
}


-(void)createHeadView
{
    NSArray *arr = @[@"Total",@"Location",@"Species"];
    LSSwitchTitleView *switchTitleView = [[LSSwitchTitleView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) titleArray:arr textColor:[UIColor colorWithRGBString:COLOR_YELLOW_1A1A1A] selectedColor: [UIColor redColor]  lineViewColor: [UIColor colorWithRed:0.22f green:0.65f blue:0.85f alpha:1.00f] bgColor:[UIColor whiteColor] lineViewColor:COLOR_LINEVIEW_F0F0F  selecte:^(NSInteger index) {
        _isHidden=YES;

        switch (index) {
            case 0://总数
            {
                MMLog(@"总数");
                [self.operationView removeFromSuperview];

            }
                break;
            case 1:
            {//按存储点查询
                self.StoragePoints = [NSMutableArray arrayWithObjects:@"1 storage point",@"2 storage point",@"3 storage point",@"4 storage point", nil];
                isType = YES;
                if (_isHidden) {
                    [self.view addSubview:self.operationView];
                    _isHidden = !_isHidden;
                }else{
                    [self.operationView removeFromSuperview];
                    _isHidden = !_isHidden;
                }
            }
                break;
            case 2:
            { // 按种类查询
                isType = NO;
                self.itemsCategorys = [NSMutableArray arrayWithObjects:@"Medicine",@"Food",@"Tent", nil];

                if (_isHidden) {
                    [self.view addSubview:self.operationView];
                    _isHidden = !_isHidden;
                }else{
                    [self.operationView removeFromSuperview];
                    _isHidden = !_isHidden;
                }

            
            
            }
                
            default:
                break;
        }
        [self.tableView reloadData];
    }];
    self.tableView.tableHeaderView = switchTitleView;
}


//z制造假数据
-(void)createData{
    for (int i =0 ; i< 13; i++) {
        ReliefMaterialModel * model = [[ReliefMaterialModel alloc]init ];
        model.MaterialsName = @"Drug";
        model.urlImage = @"药品药箱";
        model.MaterialsNumbers = 9333;
        model.MaterialsAddress = @"No. 4 storage point";
        model.CheckTime = @"January 23 2017";//月,日,年
        [self.ReliefDataArray addObject:model];
    }
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.ReliefDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterReliefMaterialInquiryCell *cell = [tableView dequeueReusableCellWithIdentifier:relief];
    ReliefMaterialModel *model =self.ReliefDataArray [indexPath.row];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DisasterReliefMaterialInquiryCell" owner:self options:nil]lastObject];
    }
    [cell setModel:model];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return  0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

-(OperationTableVC *)operationTabVC{
    
    if (!_operationTabVC) {
        _operationTabVC = [[OperationTableVC alloc] init];
        
        if (isType) {
            _operationTabVC.dataSource = self.StoragePoints;
        }else{
            _operationTabVC.dataSource = self.itemsCategorys;
        }
//        __weak __typeof(self)weakSelf = self;
        __weak __typeof(_operationTabVC) weakTabVC = _operationTabVC;
        
        weakTabVC.sendArray=^(NSMutableArray *arr){
            self.ListArray=arr;
            _isHidden = !_isHidden;
            [self.operationView removeFromSuperview];
        };
        
    }
    return _operationTabVC;
}



-(UIView *)operationView{
    if (!_operationView) {
        _operationView = [[UIView alloc] initWithFrame:CGRectMake(0, 104, DEVICE_WIDTH, DEVICE_HEIGHT-104)];
        
        UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0,0, DEVICE_WIDTH, DEVICE_HEIGHT) ];
        footView.alpha=0.7;
        footView.backgroundColor=[UIColor blackColor];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgusterd:) ];
        [footView addGestureRecognizer:tap];
        [_operationView addSubview:footView];
        self.operationTabVC.view.frame = CGRectMake(0, 0, DEVICE_WIDTH, 30*self.StoragePoints.count);
        [_operationView addSubview:self.operationTabVC.view];
    }
    return _operationView;
}

-(void)tapgusterd:(UITapGestureRecognizer *)tapgesture
{
        _isHidden = !_isHidden;
        [self.operationView removeFromSuperview];
}
@end
