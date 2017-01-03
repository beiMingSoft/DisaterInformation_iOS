//
//  MoreInformationViewController.m
//  Disaster information
//
//  Created by ya Liu on 2016/11/23.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import "MoreInformationViewController.h"
#import "MoreTableViewCell.h"
#import "InformationModel.h"
static NSString *cellIde = @"moreInformationCell";
@interface MoreInformationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *informationData;


@end

@implementation MoreInformationViewController


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(NSMutableArray *)informationData
{
    if (!_informationData) {
        _informationData = [NSMutableArray array];
    }
    return _informationData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多资讯";
    [self createData];
    [self.view addSubview:self.tableView];
}
/**
 * 假数据
 */
-(void)createData
{

    for (int  i = 0; i < 10 ; i++) {
        InformationModel *model = [[InformationModel alloc]init ];
        model.mainTitle =  @"火山爆发后的防疫？";
        model.descriptionTitle = @"防疫说明防疫说明";
        model.browseNumber = 123;
        model.reviewNumber = 456;
        model.forwardNumber = 789;
        [self.informationData addObject:model];
    }
    


}
#pragma mark --UITableViewDelegate，UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.informationData.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    InformationModel *model = self.informationData[indexPath.row];
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MoreTableViewCell" owner:self options:nil ]lastObject ];
    }

    [cell setInformationModel:model];
    return cell;
}







@end
