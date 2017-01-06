//
//  BaseViewController.h
//  DisaterInformation
//
//  Created by ya Liu on 2016/12/11.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


- (NSString *)updateTimeForRow:(NSString *)str;

-(void)pushVC:(UIViewController *)vc;

-(void)popVC;


@end
