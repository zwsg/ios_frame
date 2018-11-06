//___HEADERFILE___
/*
 * zwsg_frame 
 * TextViewCell.m 
 * Created by xhb on 2018/10/31. 
 * QQ：692061841   	WeChat：zwsg_wechat
 * Copyright © 2018年 ZWSG. All rights reserved.

 *   █████▒█    ██  ▄████▄   ██ ▄█▀       ██████╗ ██╗   ██╗ ██████╗
 * ▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒        ██╔══██╗██║   ██║██╔════╝
 * ▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░        ██████╔╝██║   ██║██║  ███╗
 * ░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄        ██╔══██╗██║   ██║██║   ██║
 * ░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄       ██████╔╝╚██████╔╝╚██████╔╝
 *  ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒       ╚═════╝  ╚═════╝  ╚═════╝
 *  ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░
 *  ░ ░    ░░░ ░ ░ ░        ░ ░░ ░
 *           ░     ░ ░      ░  ░
 */

#import "TextViewCell.h"
#import "ZWTextViewUtil.h"

@interface TextViewCell (){
    UITextView *textView;
}
@end
@implementation TextViewCell

-(void)setUI{
    UILabel *lblTitle = [[UILabel alloc]init];
    if (![ZWStringUtil isNullOrEmpty:self.iconPath]) {
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(FORM_PADDING_LEFT, 0, FORM_ICON_WIDTH, FORM_ICON_WIDTH)];
        icon.image = [UIImage imageNamed:self.iconPath];
        icon.centerY=self.centerY;
        [self.contentView addSubview:icon];
        lblTitle.frame = CGRectMake(icon.x+icon.width+5, 0, FORM_TITLE_WIDTH, 0);
    }else{
        lblTitle.frame = CGRectMake(FORM_PADDING_LEFT, 0, FORM_TITLE_WIDTH, 0);
    }
    lblTitle.font = [UIFont systemFontOfSize:FONT_SIZE_DEFAULT];
    lblTitle.textColor = [UIColor colorWithHexString:COLR_MAIN_TITLE];
    lblTitle.text=self.title;
    lblTitle.height = [ZWWordWrapUtil adaptionHeightWithLabel:lblTitle AndWidth:FORM_TITLE_WIDTH];
    self.lblName=lblTitle;
    [self.contentView addSubview:lblTitle];
    self.height = self.cellHeigh = 100;
    lblTitle.centerY=self.centerY;
    
    textView = [[UITextView alloc]initWithFrame:CGRectMake(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER-5, 0, screenWidth-(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER)-FORM_PADDING_LEFT+5, 90)];
    textView.textColor = [UIColor colorWithHexString:COLR_SUB_TITLE];
    textView.font = [UIFont systemFontOfSize:FONT_SIZE_DEFAULT];
    self.valueView=textView;
    textView.text = self.value;
    if([ZWStringUtil isNullOrEmpty:self.placeHolder]){
        textView.placeholder=[NSString stringWithFormat:@"请输入%@",self.title];
    }else{
        textView.placeholder=self.placeHolder;
    }
    textView.maxInputLength = self.fieldLength;
    [self.contentView addSubview:textView];
    textView.centerY = self.centerY;
}
-(instancetype)initTitle:(NSString *)title key:(NSString *)key{
    if (self = [super initTitle:title key:key]) {
        [self setUI];
    }
    return self;
}
-(instancetype)initTitle:(NSString *)title key:(NSString *)key length:(NSInteger)length{
    if (self = [super initTitle:title key:key length:length]) {
        [self setUI];
    }
    return self;
}
//设置cellValue
-(void)setCellValue:(NSString *)cellValue{
    self.cellValue=cellValue;
}

-(NSString*)cellValue{
   return textView.text;
}
@end
