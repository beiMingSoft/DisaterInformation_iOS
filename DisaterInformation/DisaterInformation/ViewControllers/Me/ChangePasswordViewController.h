//
//  ChangePasswordViewController.h
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/17.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "BaseViewController.h"

@interface ChangePasswordViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordNewTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwoedNewTextFieldTwo;

- (IBAction)SubmitAction:(id)sender;

@end
