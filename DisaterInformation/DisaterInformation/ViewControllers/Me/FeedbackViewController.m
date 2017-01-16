//
//  FeedbackViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "FeedbackViewController.h"
#import "CBBTView.h"
@interface FeedbackViewController ()<UITextViewDelegate>

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"意见反馈";
    
    CBBTView * textView =[[CBBTView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 180)];
    textView.backgroundColor = [UIColor whiteColor];
    textView.placeholderColor = [UIColor lightGrayColor];
    textView.placeholder = @"您的意见是我们前进的最大动力，谢谢！";
    textView.font = [UIFont systemFontOfSize:17];
    textView.delegate = self;
    textView.layer.borderWidth =1;
    textView.layer.borderColor =[UIColor redColor].CGColor;
    [textView.layer setCornerRadius:10.0f];
    [self.view addSubview:textView];

}

- (void)textViewDidChange:(CBBTView *)textView

{
    
    if([textView.placeholder length] == 0)
    {
        return;
    }
    if([textView.placeholder length]  == 0)
    {
        [textView.placeHolderLabel setAlpha:1];
    }
    else
    {
        [textView.placeHolderLabel  setAlpha:0];
    }
    
    if ([textView.text isEqualToString:@""]) {
        [textView.placeHolderLabel setAlpha:1];
    }
}



@end
