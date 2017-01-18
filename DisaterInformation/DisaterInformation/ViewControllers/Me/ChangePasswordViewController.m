//
//  ChangePasswordViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/17.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextFieldDelegate>

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.oldPasswordTextField.delegate = self;


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.oldPasswordTextField resignFirstResponder];
    [self.passwordNewTextField resignFirstResponder];
    [self.passwoedNewTextFieldTwo resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.oldPasswordTextField resignFirstResponder];
    [self.passwordNewTextField resignFirstResponder];
    [self.passwoedNewTextFieldTwo resignFirstResponder];
    return YES;
}

- (IBAction)SubmitAction:(id)sender {
    [self.oldPasswordTextField resignFirstResponder];
    [self.passwordNewTextField resignFirstResponder];
    [self.passwoedNewTextFieldTwo resignFirstResponder];
    
    
    
    [self popVC];
}
@end
