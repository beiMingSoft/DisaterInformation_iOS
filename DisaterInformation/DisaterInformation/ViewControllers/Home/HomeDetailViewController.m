//
//  HomeDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/4.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "selfRescueCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MoviePlayerViewController.h"
#import "KRVideoPlayerController.h"
@interface HomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *imageView;

    MPMoviePlayerController *_playVC;
    
}

@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *dataArray;
@property(nonatomic ,strong)NSMutableArray *images;
@property(nonatomic ,strong)KRVideoPlayerController *videoController;

@end

@implementation HomeDetailViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT - 64) style:UITableViewStylePlain ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }

    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createData];
    [self.view addSubview:self.tableView];
    self.title = @"Detail";
    self.tableView.tableFooterView = [[UIView alloc]init ];
    self.tableView.showsVerticalScrollIndicator = NO;
//    [self createImageView];
}

-(void)createData
{
    if (self.news_Id == 0) {
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-1",@"pic-2",@"pic-3",@"pic-4", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Choose more strong load bearing, small kitchen, bathroom, and other temporary shelter; do not ride or hide in the elevator",@"Do not follow the crowds to escape downstairs crowded, do not blindly jump to escape",@"If too late to run quickly hid the strong table, bed, next to the strong roots, solid furniture",@"Away from the smoke halogen, water towers, tall trees, especially the glass wall of the wall, as far as possible open space net", nil ];
    }else if (self.news_Id == 1){
    
//        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-selfsave1",@"pic-selfsave2",@"pic-selfsave3", nil ];
//        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"自救脱险",@"如何寻找被压埋的人",@"救人注意事项", nil ];
//        MoviePlayerViewController *movie = [[MoviePlayerViewController alloc]init];
//        //    [self.navigationController pushViewController:movie animated:NO];
//        //    movie.modalTransitionStyle = 0;
//        [self presentViewController:movie animated:YES completion:^{
        

//        }];
        
//        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_WIDTH*(9.0/16.0))];
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        __weak typeof(self) weakSelf = self;

        self.videoController.dimissCompleteBlock =^ {
            __strong typeof(weakSelf) strongSelf = weakSelf;//加一下强引用，避免weakSelf被释放掉
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        NSString *path = [[NSBundle mainBundle] pathForResource:@"地震自救互救_超清" ofType:@"mp4"];
        NSLog(@"%@", path);
        NSURL *url = [NSURL fileURLWithPath:path];
        self.videoController.contentURL = url;
        [self.videoController showInWindow];

    
    }else if (self.news_Id == 10){
    
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-floor1",@"pic-floor2",@"pic-floor3",@"pic-floor4", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Attention should be paid to the latest forecast of meteorological departments on heavy rain",@"Before the rainstorm, low-lying areas should be placed at the door baffle",@"Check farmland, fishpond drainage",@"Heavy rain, floods, dangerous areas", nil ];
        
    }else if (self.news_Id == 20){
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-huapo1",@"pic-huapo2",@"pic-huapo3", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Landslides, debris flow, the occurrence of the collapse of the season, place",@"Landslides, debris flow, collapse of the signs",@"Landslide, Debris Flow, Collapse Occurrence and Countermeasures", nil ];
    }else if (self.news_Id == 30){
        
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-taifeng1",@"pic-taifeng2",@"pic-taifeng3",@"pic-taifeng4", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Typhoons, storm tide little common sense",@"Typhoon warning",@"typhoon, the storm before the advent of preparation measures",@"Do not go out when the typhoon come", nil ];
    
    }else if (self.news_Id == 40){
    
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-taifeng1",@"pic-taifeng2",@"pic-taifeng3",@"pic-taifeng4", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Typhoons, storm tide little common sense",@"Typhoon warning",@"typhoon, the storm before the advent of preparation measures",@"Do not go out when the typhoon come", nil ];

    }else if (self.news_Id == 50){
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-xinzang1",@"pic-xinzang2",@"pic-xinzang3",@"pic-xinzang4",@"pic-xinzang5",@"pic-xinzang6",@"pic-xinzang7", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Check response",@"Establish an airway",@"Check for breathing",@"If still no signs of lisfe",@"if the person shows signs of life",@"if the person shows signs of lif",@"continue until help arrives", nil ];
    
    }else if (self.news_Id == 51){
    
        self.images = [[NSMutableArray alloc]initWithObjects:@"pic-rengong1",@"pic-rengong2",@"pic-rengong3",@"pic-rengong4",@"pic-rengong5", nil ];
        self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Uncover the wounded person's clothes so that the chest is free to expand and does not affect breathing.", @"Remove the victim's food from the mouth and prevent debris.", @"Let the victim lie flat and open the airway", @"Protect the injured person's head", @"to the injured ventilation", nil ];
    
    }else if (self.news_Id == 1000){
    
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        __weak typeof(self) weakSelf = self;
        
        self.videoController.dimissCompleteBlock =^ {
            __strong typeof(weakSelf) strongSelf = weakSelf;//加一下强引用，避免weakSelf被释放掉
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        NSString *path = [[NSBundle mainBundle] pathForResource:@"地震科普知识_超清" ofType:@"mp4"];
        NSLog(@"%@", path);
        NSURL *url = [NSURL fileURLWithPath:path];
        self.videoController.contentURL = url;
        [self.videoController showInWindow];
    
    
    
    }else if (self.news_Id == 1001){
        
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        __weak typeof(self) weakSelf = self;
        
        self.videoController.dimissCompleteBlock =^ {
            __strong typeof(weakSelf) strongSelf = weakSelf;//加一下强引用，避免weakSelf被释放掉
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        NSString *path = [[NSBundle mainBundle] pathForResource:@"地質篇 3 地震是如何形成的?_超清" ofType:@"mp4"];
        NSLog(@"%@", path);
        NSURL *url = [NSURL fileURLWithPath:path];
        self.videoController.contentURL = url;
        [self.videoController showInWindow];
        
        
        
    }else if (self.news_Id == 2000){
        
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        __weak typeof(self) weakSelf = self;
        
        self.videoController.dimissCompleteBlock =^ {
            __strong typeof(weakSelf) strongSelf = weakSelf;//加一下强引用，避免weakSelf被释放掉
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        NSString *path = [[NSBundle mainBundle] pathForResource:@"zsd泥石流的形成_超清" ofType:@"mp4"];
        NSLog(@"%@", path);
        NSURL *url = [NSURL fileURLWithPath:path];
        self.videoController.contentURL = url;
        [self.videoController showInWindow];
        
        
        
    }

    self.automaticallyAdjustsScrollViewInsets = NO;
}




#pragma mark ---UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.images.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    selfRescueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIde"];
    if (cell == nil) {
        cell = [[selfRescueCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIde" ];
    }
    cell.selectionStyle = NO;
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.contentLabel.text = self.dataArray[indexPath.row];
    cell.urlImageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 170;

}




@end
