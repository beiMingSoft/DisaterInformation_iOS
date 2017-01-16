//
//  CBBTView.h
//  textViewPlaceholder
//
//  Created by ya Liu on 2016/12/30.
//  Copyright © 2016年 wasterd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBBTView : UITextView
@property(nonatomic) UILabel *placeHolderLabel;
@property(nonatomic) NSString *placeholder;
@property(nonatomic) UIColor *placeholderColor;

@end
