//
//  VolunteerInquiriesViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//
/**
 *  志愿者查询
 */
#import "VolunteerInquiriesViewController.h"
#import "LSSwitchTitleView.h"
#import "VolunteerInquiriesCell.h"
#import "VolunteerInquiriesModel.h"
#import "VolunteerInDetailViewController.h"
static NSString *cellIde = @"volunteerCell";

@interface VolunteerInquiriesViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isPerson;
}
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *volunteerArr;
@property(nonatomic ,strong)NSMutableArray *personArr;

@end

@implementation VolunteerInquiriesViewController

-(NSMutableArray *)volunteerArr
{
    if (!_volunteerArr) {
        _volunteerArr = [[NSMutableArray alloc]init ];
    }
    return _volunteerArr;
}


-(NSMutableArray *)personArr
{
    if (!_personArr) {
        _personArr = [[NSMutableArray alloc]init ];
    }
    return _personArr;
}

-(void)createData
{
        for (int i = 0; i < 10; i++) {
            VolunteerInquiriesModel *model = [[VolunteerInquiriesModel alloc]init ];
            model.name = [NSString stringWithFormat:@"张三%d",i];
            model.tel = [NSString stringWithFormat:@"1821%d98712%d",i,i];
            model.address = @"北京市海淀区上地九街中关村软件园微软大厦1101室";
            model.imageStr = @"home_btn_travel";
            [self.personArr addObject:model];
        }
        for (int i = 0; i < 5; i++) {
            VolunteerInquiriesModel *model = [[VolunteerInquiriesModel alloc]init ];
            model.name = [NSString stringWithFormat:@"李四%d",i];
            model.tel = [NSString stringWithFormat:@"1821%d98712%d",i,i];
            model.address = @"昌平区沙河镇于新家园1111室";
            model.imageStr = @"home_btn_travel";
            [self.volunteerArr addObject:model];
        }
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:DEVICE_BOUNDS style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"志愿者查询";
    self.view.backgroundColor = [UIColor whiteColor];
    isPerson = NO;
    [self createHeadView];
    [self createData];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init ];
}

-(void)createHeadView
{
    NSArray *arr = @[@"志愿组织",@"个人组织"];
    LSSwitchTitleView *switchTitleView = [[LSSwitchTitleView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) titleArray:arr textColor:[UIColor redColor] selectedColor:[UIColor colorWithRGBString:COLOR_YELLOW_1A1A1A]lineViewColor: [UIColor colorWithRed:0.22f green:0.65f blue:0.85f alpha:1.00f] bgColor:[UIColor whiteColor] lineViewColor:COLOR_LINEVIEW_F0F0F  selecte:^(NSInteger index) {
                switch (index) {
            case 0:
                        isPerson = NO;
                break;
            case 1:
                        isPerson = YES;
                        
                break;
            default:
                break;
        }
        [self.tableView reloadData];
    }];
    self.tableView.tableHeaderView = switchTitleView;
}
#pragma mark --UITableViewDelegate，UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isPerson) {
     return  self.personArr.count;
    }else{
    
    return self.volunteerArr.count;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VolunteerInquiriesModel *model;
    if (isPerson) {
        model = self.personArr[indexPath.row];
    }else{
      model = self.volunteerArr[indexPath.row];
    }
    
    VolunteerInquiriesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"VolunteerInquiriesCell" owner:self options:nil ]lastObject ];
    }
    cell.nameLabel.text = model.name;
    cell.telLabel.text = model.tel;
    cell.addressLabel.text = model.address;
    cell.photoImageView.image = [UIImage imageNamed:model.imageStr];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return   GMLAYOUTRATE(90);
//    return 90;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VolunteerInDetailViewController * vdvc = [[VolunteerInDetailViewController alloc]init ];
    [self.navigationController pushViewController:vdvc animated:YES];
}




@end
