//
//  FeedbackViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/9.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "FeedbackViewController.h"
#import "NSString+size.h"
@interface FeedbackViewController ()<UITextViewDelegate>
@property(nonatomic ,strong)UITextView *textView;
@property(nonatomic ,strong) UILabel *placeholder ;
@end

@implementation FeedbackViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"commit_icon" select:@selector(commitActionClicked) target:self];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 70, DEVICE_WIDTH - 20, 180) ];
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.masksToBounds = YES;
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.delegate = self;
    self.textView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.textView];
    NSString *str = @"Your opinion is the biggest driving force of our progress, thank you!";
    
    CGSize size = [NSString sizeWithString:str andFont:font14 andMaxSize:CGSizeMake(DEVICE_WIDTH - 20, CGFLOAT_MAX)];
     self.placeholder  = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, DEVICE_WIDTH, size.height) ];
     self.placeholder.text = str;
     self.placeholder.textColor = [UIColor colorWithRGBString:COLOR_LIGHTGRAY_999999];
     self.placeholder.font = font14;
     self.placeholder.numberOfLines = 0;
     [self.textView addSubview: self.placeholder];
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.placeholder.hidden = YES;

    
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        self.placeholder.hidden = NO;
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textView resignFirstResponder];

}

-(void)commitActionClicked
{
    MMLog(@"提交");
    [self popVC];
}

@end
