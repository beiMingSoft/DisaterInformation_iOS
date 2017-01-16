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
@property(nonatomic ,assign)BOOL isHidden;
@property(nonatomic ,strong) UIView *screenView;

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
            model.name = [NSString stringWithFormat:@"ZhangSan%d",i];
            model.tel = [NSString stringWithFormat:@"1821%d98712%d",i,i];
            model.address = @"Room 1101, Microsoft Building, Zhongguancun Software Park, Shangdi Jiujie, Haidian District, Beijing";
            model.imageStr = @"UserImage";
            [self.personArr addObject:model];
        }
        for (int i = 0; i < 5; i++) {
            VolunteerInquiriesModel *model = [[VolunteerInquiriesModel alloc]init ];
            model.name = [NSString stringWithFormat:@"LiSi%d",i];
            model.tel = [NSString stringWithFormat:@"1821%d98712%d",i,i];
            model.address = @"Changping District Shahe Town in the new home 1111 room";
            model.imageStr = @"UserImage";
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
    self.view.backgroundColor = [UIColor whiteColor];
    isPerson = NO;
    [self createHeadView];
    [self createData];
  
    [self.view addSubview:self.tableView];
    self.isHidden = YES;
    self.tableView.tableFooterView = [[UIView alloc]init ];
}

-(void)createHeadView
{
    NSArray *arr = @[@"Organization",@"personal"];
    LSSwitchTitleView *switchTitleView = [[LSSwitchTitleView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) titleArray:arr textColor:[UIColor colorWithRGBString:COLOR_YELLOW_1A1A1A] selectedColor:[UIColor colorWithRGBString:COLOR_009fe8] lineViewColor: [UIColor colorWithRGBString:COLOR_009fe8] bgColor:[UIColor whiteColor] lineViewColor:COLOR_LINEVIEW_F0F0F  selecte:^(NSInteger index) {
                switch (index) {
            case 0:
                        isPerson = NO;
                        self.navigationItem.hidesBackButton = YES;
                        self.navigationItem.rightBarButtonItem.customView.hidden=YES;
                break;
            case 1:
                        isPerson = YES;
                        self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"screen_icon" select:@selector(searchAction) target:self];
                        
                        
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
//  return   GMLAYOUTRATE(90);
    return 90;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.screenView removeFromSuperview];
    self.isHidden  = !self.isHidden;

    VolunteerInDetailViewController * vdvc = [[VolunteerInDetailViewController alloc]init ];
    [self.navigationController pushViewController:vdvc animated:YES];
}


-(void)searchAction
{
    if (self.isHidden) {
            [self.view addSubview:self.screenView];
        self.isHidden  = !self.isHidden;
    }else{
        [self.screenView removeFromSuperview];
        self.isHidden  = !self.isHidden;
    }
}


-(UIView *)screenView
{
    NSArray *titles = @[@"Medicine",@"Teach",@"Doctor",@"Repair",@"Welder"];
    if (!_screenView) {
        _screenView  = [[UIView alloc]initWithFrame:CGRectMake(DEVICE_WIDTH - 100, 64, 100, titles.count * 30) ];
        _screenView.backgroundColor = [UIColor colorWithRed:128/255 green:128/255 blue:128/255 alpha:0.7];
        for (int i = 0 ; i < titles.count ; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0,  30 * i, 100, 30);
            [button setTitle:titles[i] forState:UIControlStateNormal];
            button.tag = 9999 + i;
            [button addTarget:self action:@selector(screenAction:) forControlEvents:UIControlEventTouchUpInside];
            [_screenView addSubview:button];
            
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame), 100, 1) ];
            lineView.backgroundColor = [UIColor whiteColor];
            [_screenView addSubview:lineView];
        }
        
    }
    return _screenView;
}

-(void)screenAction:(UIButton *)sender
{
    [self.screenView removeFromSuperview];
    self.isHidden = !self.isHidden;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.screenView removeFromSuperview];
    self.isHidden = !self.isHidden;

}
@end
