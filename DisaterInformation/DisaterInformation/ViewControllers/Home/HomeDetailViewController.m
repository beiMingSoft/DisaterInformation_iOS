//
//  HomeDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/4.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()
{
    UIImageView *imageView;
}
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.title;
    [self createImageView];
}


-(void)createImageView
{
   imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT - 64) ];
    if (self.news_Id == 0) {
        imageView.image = [UIImage imageNamed:@"Earthquake knowledge_icon"];

    }else if( self.news_Id == 1){
        imageView.image = [UIImage imageNamed:@"Earthquake_escape_icon"];
    }else{
        imageView.image = [UIImage imageNamed:@"Earthquake_saveSelfHelpearchother"];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:) ];
    [imageView addGestureRecognizer:tap];
    [self.view addSubview:imageView];
}

-(void)tapAction:(UITapGestureRecognizer *)tapgesture
{
    
    imageView.frame = CGRectMake(0, 64, DEVICE_WIDTH * 1.3, DEVICE_HEIGHT * 1.3);
    

}

@end
