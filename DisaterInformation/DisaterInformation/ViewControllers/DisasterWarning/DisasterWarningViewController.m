//
//  DisasterWarningViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "DisasterWarningViewController.h"
#import "CustomHeaderView.h"
#import "DisasterWarningCell.h"
#import "DisasterWarningModel.h"
#import "DisasterWarningDetailViewController.h"
#import "WaringTableViewCell.h"
static NSString *waringCell = @"cell";

@interface DisasterWarningViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *homeDataArray;

@end

@implementation DisasterWarningViewController


-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

-(NSMutableArray *)homeDataArray
{
    if (!_homeDataArray) {
        _homeDataArray = [[NSMutableArray alloc]init ];
    }
    return _homeDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0f;
}

//z制造假数据
-(void)createData{
    
    for (int i =0 ; i< 3; i++) {
       
        DisasterWarningModel * model = [[DisasterWarningModel alloc]init ];
        if (i == 0 ){
            model.mainTitle = @"Baiyun Obo Mining District Meteorological Bureau issued road icing yellow warning [III grade / larger]";
            model.time = @"1483632000";
            model.from = @"Bureau of Meteorology, Bayan Obo Mining Area";
            model.news_Id = i;
        }else  if( i == 1){
            model.mainTitle = @"Fangchenggang City, Guangxi issued a strong blue warning";
            model.time = @"1482972540";
            model.from = @"China Meteorological Administration website";
            model.news_Id = i;
            model.urlStr = @"guangxi_waring_icon";
            model.isPic = YES;
        }else {
//            model.urlStr = @"disater";
//            model.isPic = YES;
            model.time = @"1451868540";
            model.mainTitle = @"A SURVEY OF SEISMICITY IN YUNAN AND ITS PERIPHERY IN JANUARY";
            model.from = @"Earthquake Monitoring Center";
            model.news_Id = i;
        }
        [self.homeDataArray addObject:model];
    }
}



#pragma mark --- UITableViewDelegate，UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.homeDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    WaringTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:waringCell];
    
    if (cell == nil) {
        cell = [[WaringTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:waringCell model:model ];
    }
//    [cell setModel:model];
    cell.urlImageView.image = [UIImage imageNamed:model.urlStr];
    cell.mainTitleLabel.text = model.mainTitle;
    cell.mainTitleLabel.font = font14;
    cell.timeLabel.text = [self updateTimeForRow:model.time];
    cell.fromLabel.text = model.from;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//
//    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
//    return model.cellHeight;
    
    return 80;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DisasterWarningModel *model = self.homeDataArray[indexPath.row];
    DisasterWarningDetailViewController *wdvc = [[DisasterWarningDetailViewController alloc]init ];
    wdvc.news_ID = model.news_Id;
    wdvc.picStr = model.urlStr;
    [self pushVC:wdvc];
}

@end
