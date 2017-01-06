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
    if (self.news_Id == 0 ) {
        imageView.image = [UIImage imageNamed:@"Earthquake knowledge_icon"];

    }else if( self.news_Id == 1|| self.news_Id == 1000){
        imageView.image = [UIImage imageNamed:@"Earthquake_escape_icon"];
    }else if (self.news_Id == 2){
        imageView.image = [UIImage imageNamed:@"Earthquake_saveSelfHelpearchother"];

    }else if (self.news_Id == 10){
        imageView.image = [UIImage imageNamed:@"05暴雨洪涝的防范1.jpg"];

    }else if (self.news_Id == 11){
        imageView.image = [UIImage imageNamed:@"06暴雨洪涝的防范2.jpg"];

    }else if (self.news_Id == 12){
        imageView.image = [UIImage imageNamed:@"Flood_icon"];

    }else if (self.news_Id == 20){
        imageView.image = [UIImage imageNamed:@"04滑坡、泥石流、崩塌的防范1.jpg"];

    }else if (self.news_Id == 21){
        imageView.image = [UIImage imageNamed:@"04滑坡、泥石流、崩塌的防范.jpg"];
        
    }else if (self.news_Id == 30){
        imageView.image = [UIImage imageNamed:@"08台风、风暴潮的防范1.jpg"];
        
    }else if (self.news_Id == 31){
        imageView.image = [UIImage imageNamed:@"09台风、风暴潮的防范.jpg"];
        
    }else if (self.news_Id == 40){
        imageView.image = [UIImage imageNamed:@"15家庭火灾的防范1.jpg"];
        
    }else if (self.news_Id == 41){
        imageView.image = [UIImage imageNamed:@"14家庭火灾逃生.jpg"];
        
    }
    else{
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
