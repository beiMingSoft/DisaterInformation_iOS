//
//  RRZSendShowTextCell.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/13.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "RRZSendShowTextCell.h"
#import "CBBTView.h"
@interface RRZSendShowTextCell()<UITextViewDelegate>


@end

@implementation RRZSendShowTextCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    CBBTView *contentTextView =[[CBBTView alloc] initWithFrame:CGRectMake(7,7, DEVICE_WIDTH - 7*2, 180)];
    contentTextView.backgroundColor = [UIColor whiteColor];
    contentTextView.placeholderColor = [UIColor lightGrayColor];
    contentTextView.placeholder = @"Please  Entry Content";
    contentTextView.font = [UIFont systemFontOfSize:17];
    contentTextView.delegate = self;
    contentTextView.layer.borderWidth =1;
    contentTextView.layer.borderColor =[UIColor lightGrayColor].CGColor;
    [contentTextView.layer setCornerRadius:5];
    [self.contentView addSubview:contentTextView];
    self.contentTextView = contentTextView;
        
    }
    return self;
}


@end
