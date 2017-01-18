//
//  LoginViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/12.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPwdViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic ,strong) UITextField *userTextField;//用户名
@property(nonatomic ,strong) UITextField *passwordTextField;//密码

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"Login";
    [self createUI];
}

-(void)createUI
{
    //头像
    UIImageView *imageView = [[UIImageView alloc]init ];
    imageView.image = [UIImage imageNamed:@"UserImage"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.left.equalTo(self.view.mas_left).offset((DEVICE_WIDTH-80)/2);
    }];
    
     //用户名
      self.userTextField = [[UITextField alloc]init ];
      self.userTextField.placeholder = @"Tel/Email";
      self.userTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
      self.userTextField.layer.borderWidth = 1;
      self.userTextField.layer.cornerRadius = 5;
      self.userTextField.layer.masksToBounds = YES;
      self.userTextField.text = @"649949178@qq.com";
      self.userTextField.delegate = self;
      self.userTextField.returnKeyType = UIReturnKeyDone;

    UIImageView *leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20) ];
    leftImageView.image = [UIImage imageNamed:@"iphone"];
      self.userTextField.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
      self.userTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
      self.userTextField.leftView = leftImageView;
    [self.view addSubview:  self.userTextField];
    [ self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(20);
        make.left.equalTo(@30);
        make.right.equalTo(@-30);
        make.height.offset(30);
    }];
    
    //密码
     self.passwordTextField = [[UITextField alloc]init ];
     self.passwordTextField.placeholder = @"6-24 combination of numbers and letters";
     self.passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
     self.passwordTextField.layer.borderWidth = 1;
     self.passwordTextField.layer.cornerRadius = 5;
     self.passwordTextField.layer.masksToBounds = YES;
     self.passwordTextField.delegate = self;
     self.passwordTextField.text = @"111111111";
     self.passwordTextField.returnKeyType = UIReturnKeyDone;
    UIImageView *passwordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20) ];
    passwordImageView.image = [UIImage imageNamed:@"password"];
    self.passwordTextField.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
    self.passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordTextField.leftView = passwordImageView;
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTextField.mas_bottom).offset(10);
        make.left.right.height.equalTo(self.userTextField);
    }];
    
    
    //忘记密码
    UIButton *forgetPWDButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPWDButton setTitle:@"Forget" forState:UIControlStateNormal];
    [forgetPWDButton setTitleColor:[UIColor colorWithRGBString:COLOR_BLACK_333333] forState:UIControlStateNormal];
    forgetPWDButton .layer.cornerRadius =  5;
    forgetPWDButton.layer.masksToBounds = YES;
    forgetPWDButton.layer.borderWidth = 0.5;
    forgetPWDButton.titleLabel.font = font12;
    forgetPWDButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [forgetPWDButton addTarget:self action:@selector(forgetPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPWDButton];
    [forgetPWDButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(15);
        make.left.equalTo(self.passwordTextField);
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    //记住密码
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setTitle:@"Remember" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(forgetPWDButton);
        make.right.equalTo(self.passwordTextField);
        make.size.equalTo(forgetPWDButton);
    }];
    
    
    UIButton *selctBtn;
    //登录/注册
    NSArray *titles = @[@"Login",@"Register"];
    for (int i = 0; i < titles.count; i ++) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginButton setTitle:titles[i] forState:UIControlStateNormal];
        loginButton.backgroundColor= [UIColor colorWithRGBString: COLOR_009fe8 ];
        [loginButton addTarget:self action:@selector(loginOrRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
        
        loginButton.tag = i + 99999;
        
        [self.view addSubview:loginButton];
        [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(forgetPWDButton.mas_bottom).offset((70 + i * 50));
            make.left.equalTo(@80);
            make.right.equalTo(@-80);
            make.height.offset(40);
        }];
        selctBtn = loginButton;
    }
    
    
    
    
    
    //第三方登录
    UIView *sqliteLine = [[UIView alloc]init ];
    sqliteLine.backgroundColor = [UIColor colorWithRGBString:COLOR_LINEVIEW_F0F0F];
    [self.view addSubview:sqliteLine];
    [sqliteLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selctBtn.mas_bottom).offset(70);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.offset(1);
    }];
    
    NSInteger buttonWidth = 60, buttonHeight = 60;
    NSInteger  space = (DEVICE_WIDTH - 60 * 3)/4;
    NSArray *images = @[@"feedback",@"weixin",@"twitter"];
    
    for (int  i = 0 ; i < 3; i ++) {
        UIButton *thirdLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [thirdLoginBtn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [self.view addSubview:thirdLoginBtn];
    [thirdLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sqliteLine.mas_bottom).offset(20);
        make.left.offset(i *space + i *buttonWidth +space);
        make.size.mas_equalTo(CGSizeMake(buttonWidth, buttonHeight));
    }];
    }
}
-(void)forgetPasswordAction
{
    ForgetPwdViewController *fpvc = [[ForgetPwdViewController alloc]init ];
    [self.navigationController pushViewController:fpvc animated:YES];
}



-(void)loginOrRegisterAction:(UIButton *)sender
{
    NSInteger tag = sender.tag - 99999;
    if (tag == 0) {
        [[NSUserDefaults standardUserDefaults]setValue:self.userTextField.text forKey:@"userName"];
        [self.navigationController popViewControllerAnimated:YES];
    
    }else{
        MMLog(@"register");
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;

}


@end
