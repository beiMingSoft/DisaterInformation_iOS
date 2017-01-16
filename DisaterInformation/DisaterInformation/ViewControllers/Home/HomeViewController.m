//
//  HomeViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomHeaderView.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "DisasterWarningViewController.h"
#import "SelfHelpmutualGuideViewController.h"
#import "DisasterScienceKnowledgeViewController.h"
#import "RiskDistributionViewController.h"
#import "RestorationAndReconstructionVC.h"
#import "EvacuationSitesViewController.h"
#import "DisasterReliefMaterialInquiryViewController.h"
#import "VolunteerInquiriesViewController.h"
#import "MTSearchBar.h"
#import "ToolObject.h"
#import "MeInfoViewController.h"
#import "HomeDetailViewController.h"
#import "DisasterKnowledgeViewController.h"
#import "SearchViewController.h"
#import "CCCycleScrollView.h"
#import "LoginViewController.h"
@interface HomeViewController ()<sendActionAndIndexDelegate,UITextFieldDelegate,CCCycleScrollViewClickActionDeleage>
@property(nonatomic ,strong)NSMutableArray *homeDataArray;
@property(nonatomic ,strong)UITextField *textField;
@property(nonatomic ,strong)CCCycleScrollView *cyclePlayView;
@property(nonatomic ,strong) NSArray *titleArr;
@end

@implementation HomeViewController


-(NSMutableArray *)homeDataArray
{
    if (!_homeDataArray) {
        _homeDataArray = [[NSMutableArray alloc]init ];
    }
    return _homeDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSearchView];
    //设置左导航按钮
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"userTestPhoto1" select:@selector(backButtonClick) target:self];
    [self createMainView];

//    self.automaticallyAdjustsScrollViewInsets = YES;
}


-(void)createMainView
{

    UIScrollView *scrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT ) ];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];


    NSMutableArray *images = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"mengjiala_equake_icon"],[UIImage imageNamed:@"mengjiala_quacke_icon2"],[UIImage imageNamed:@"mengjiala_haixiao_icon"], nil];
    NSArray *titleArray = @[@"Mutual aid after earthquake",@"The little boy was in ruins after the earthquake",@"The tsunami is coming"];
    self.cyclePlayView = [[CCCycleScrollView alloc]initWithImages:images];
    self.cyclePlayView.pageDescrips = titleArray;
    self.cyclePlayView.delegate = self;
    
    self.cyclePlayView.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:self.cyclePlayView];
    
   self.titleArr = @[@"Warning",@"Self Rescue",@"Knowledge",@"Risk Map",@"Reconstruction",@"Shelter",@"Stockpile",@"Volunteers"];
    NSArray *imageArr =@[@"waring_home_icon",@"selfRescue_home_icon",@"knownledge_home_icon",@"riskMap_home_icon",@"reconstruction_home_icon",@"shelter_home_icon",@"stockplie_home_icon",@"volunteers_home_icon"];
    
    // 九宫格
    NSInteger totalloc=2;
    CGFloat appvieww = (DEVICE_WIDTH)/2;
    CGFloat appviewh =(DEVICE_HEIGHT -64)/4;
    CGFloat margin = (DEVICE_WIDTH-totalloc*appvieww)/(totalloc+1);
    for (int  i = 0 ; i < self.titleArr.count; i++) {
        int row = i/totalloc;//行号
        //1/3=0,2/3=0,3/3=1;
        int loc=i%totalloc;//列号
        CGFloat appviewx = margin+(margin+appvieww)*loc;
        CGFloat appviewy = margin+(margin+appviewh)*row + 64;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(appviewx, appviewy, appvieww, appviewh) ;
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        if (i == 0){
            button.backgroundColor = [UIColor colorWithRGBString: COLOR_27d983 ];
        }else if (i == 1) {
            button.backgroundColor = [UIColor colorWithRGBString:COLOR_22bf73 ];
        }else if( i == 2){
            button.backgroundColor = [UIColor colorWithRGBString:COLOR_08abe8];
        }else if (i == 3) {
            button.backgroundColor = [UIColor colorWithRGBString: COLOR_0697cc  ];
        }else if( i == 4){
            button.backgroundColor = [UIColor colorWithRGBString:COLOR_00d5e8  ];
        }else if (i == 5) {
            button.backgroundColor = [UIColor colorWithRGBString:COLOR_00bbcc];
        }else if( i == 6){
            button.backgroundColor = [UIColor colorWithRGBString: COLOR_5870e8  ];
        }else if (i == 7) {
            button.backgroundColor = [UIColor colorWithRGBString:COLOR_4e63cc];
        }
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        button.titleLabel.font = font12;
//        [button setTitleColor:[UIColor colorWithRGBString:COLOR_SPOTTITLE_111111] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag  = 1000+i;
        if (i == 0) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(button.imageView.frame) + 5, CGRectGetMinY(button.imageView.frame) -10, 20, 20) ];
            label.layer.cornerRadius = 10;
            label.layer.masksToBounds = YES;
            label.text = @"3";
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.backgroundColor = [UIColor redColor];
            [button addSubview:label];
        }
        // 按钮图片和标题总高度
        CGFloat totalHeight = (button.imageView.frame.size.height + button.titleLabel.frame.size.height);
        // 设置按钮图片偏移
        if( i == 3){
            [button setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - button.imageView.frame.size.height + 10), 0.0, 0.0, -button.titleLabel.frame.size.width)];

        }else{
        
            [button setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - button.imageView.frame.size.height +15), 0.0, 0.0, -button.titleLabel.frame.size.width)];

        }
       // 设置按钮标题偏移
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -button.imageView.frame.size.width, -(totalHeight - button.titleLabel.frame.size.height +10),0.0)];
        [self.view addSubview: button];
    }
    
    
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(0, DEVICE_HEIGHT * 0.97);
}

-(void)buttonClicked:(UIButton *)btn
{
    
    NSInteger tag = btn.tag - 1000;
    UIViewController *vc = nil;
    switch (tag) {
        case 0:// 灾害预警
            vc = [[DisasterWarningViewController alloc]init];
            break;
        case 1://自救互助
            vc = [[SelfHelpmutualGuideViewController alloc]init ];
            
            break;
        case 2://灾害科普
            // vc = [[DisasterScienceKnowledgeViewController alloc]init ];
            vc = [[DisasterKnowledgeViewController alloc]init ];
            
            
            break;
        case 3: //风险分布
            vc = [[RiskDistributionViewController alloc]init ];
            
            break;
        case 4:// 恢复重建指南
            
            vc = [[RestorationAndReconstructionVC alloc]init ];
            break;
        case 5://避难场所
            vc = [[EvacuationSitesViewController alloc]init ];
            
            break;
        case 6://救灾物资查询
        {
            vc = [[DisasterReliefMaterialInquiryViewController alloc]init ];
            NSString *userNmae = [[NSUserDefaults standardUserDefaults]valueForKey:@"userName" ];
            
            if ([userNmae  isEqualToString:@"649949178@qq.com"]) {
                vc.title = self.titleArr[tag];
            }else{
                [self alter:vc];

            }
        }
            break;
        case 7://志愿者
            vc = [[VolunteerInquiriesViewController alloc]init ];
            break;
        default:
            break;
    }
    vc.title = self.titleArr[tag];
    [self.navigationController pushViewController:vc animated:YES];}



-(void)createSearchView
{
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, DEVICE_WIDTH - 80, 30) ];
     self.textField.font =  font14;
     self.textField.placeholder = @"Please enter a keyword";
     self.textField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *iconImageView = [[UIImageView alloc]init ];
    iconImageView.image = [UIImage imageNamed:@"search"];
    iconImageView.contentMode = UIViewContentModeCenter;
    iconImageView.size = CGSizeMake(30, 30);
     self.textField.leftView = iconImageView;
     self.textField.leftViewMode = UITextFieldViewModeAlways;
     self.textField.layer.cornerRadius = 15;
     self.textField.layer.masksToBounds = YES;
     self.textField.delegate = self;
     self.textField.returnKeyType = UIReturnKeyDone;
     self.navigationItem.titleView = self.textField;
}


-(void)backButtonClick
{
    MeInfoViewController *mifvc  = [[MeInfoViewController alloc]init ];
    [self.navigationController pushViewController:mifvc animated:YES];
}
-(void)alter:(UIViewController *)vc
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Please Login " message:nil preferredStyle:UIAlertControllerStyleAlert];
 
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.view endEditing:YES];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        LoginViewController *lvc = [[LoginViewController alloc]init ];
        [self.navigationController pushViewController:lvc animated:YES];

        [self.view endEditing:YES];
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    SearchViewController *svc = [[SearchViewController alloc]init ];
    [self.navigationController pushViewController:svc animated:YES];
//    [self presentViewController:svc animated:YES completion:nil];

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
