//
//  RestorationAndReconstructionVC.m
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/14.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "RestorationAndReconstructionVC.h"
#import "ZJSegmentStyle.h"
#import "ZJScrollPageView.h"
#import "RestorationListViewController.h"
#import "RestoraEditViewController.h"

@interface RestorationAndReconstructionVC ()<ZJScrollPageViewDelegate,ZJScrollPageViewChildVcDelegate>

@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;



@end

@implementation RestorationAndReconstructionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    
    
    
//    self.titles = @[@"Reconstruction policy",@"Reconstruction Planning",@"Rebuild Guidelines",@"Rebuild Progress",@"Rebuild Standard"];
    self.titles = @[@"Policy",@"Planning",@"Guidelines",@"Progress",@"Standard"];

    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    
    [self.view addSubview:scrollPageView];
    
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"edit_icon" select:@selector(editAction) target:self];
    
    
}


- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (!childVc) {
        childVc = [[RestorationListViewController alloc] init];
    }
    if (index%2==0) {
        childVc.view.backgroundColor = [UIColor blueColor];
    } else {
        childVc.view.backgroundColor = [UIColor greenColor];
        
    }
    
    NSLog(@"%ld-----%@",(long)index, childVc);
    
    return childVc;
}



-(void)editAction
{
    RestoraEditViewController * revc = [[RestoraEditViewController alloc]init];
    [self pushVC:revc];
    
}


@end
