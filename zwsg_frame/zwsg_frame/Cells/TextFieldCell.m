//___HEADERFILE___
/*
 * zwsg_frame 
 * TextFieldCell.m 
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

#import "TextFieldCell.h"
#import "WTCarKeyboard.h"
#import "ZWTextViewUtil.h"
@interface TextFieldCell ()<UITextFieldDelegate>{
    UITextField *textField;
}
@end
@implementation TextFieldCell
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
    lblTitle.centerY=self.centerY;
    self.lblName=lblTitle;
    [self.contentView addSubview:lblTitle];
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER, 0, screenWidth-(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER)-FORM_PADDING_LEFT, self.cellHeigh)];
    textField.centerY=self.centerY;
    textField.font=[UIFont systemFontOfSize:FONT_SIZE_DEFAULT];
    textField.delegate=self;
    [textField addTarget:self action:@selector(textViewDidChange:) forControlEvents:UIControlEventEditingChanged];
    textField.textColor = [UIColor colorWithHexString:COLR_SUB_TITLE];
    if ([ZWStringUtil isNullOrEmpty:self.placeHolder]) {
        textField.placeholder = [NSString stringWithFormat:@"请输入%@",self.title];
    }else{
        textField.placeholder = self.placeHolder;
    }
    [textField setValue:[UIColor colorWithHexString:COLR_PLACEHOLDER] forKeyPath:@"_placeholderLabel.textColor"];
    self.valueView=textField;
    textField.text=self.value;
    if ([self.keyboardType isEqualToString:@"CarNum"]) //车牌号键盘
    {
        WTCarKeyboard *keyBoard = [WTCarKeyboard new];
        textField.inputView = keyBoard;
    }
    else if ([self.keyboardType isEqualToString:@"Phone"]) //手机号 纯数字
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else
    {
        textField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    [self.contentView addSubview:textField];
}
-(instancetype)initTitle:(NSString *)title key:(NSString *)key{
    if (self = [super initTitle:title key:key]) {
        [self setUI];
    }
    return self;
}
-(instancetype)initIcon:(NSString *)icon title:(NSString *)title key:(NSString *)key{
    if (self = [super initIcon:icon title:title key:key]) {
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
-(instancetype)initTitle:(NSString *)title value:(NSString *)value key:(NSString *)key isRequire:(BOOL)isRequire placeHolder:(NSString *)placeHolder length:(NSInteger)length keyboardType:(NSString *)keyboardType{
    if (self = [super initTitle:title value:value key:key isRequire:isRequire placeHolder:placeHolder length:length keyboardType:keyboardType]) {
        [self setUI];
    }
    return self;
}

//设置cellValue
-(void)setCellValue:(NSString *)cellValue{
    self.cellValue=cellValue;
}

-(NSString*)cellValue{
    return textField.text;
}

- (void)textViewDidChange:(UITextField *)textView
{
    [ZWTextViewUtil textFieldDidChange:textView withMaxCount:self.fieldLength];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [ZWTextViewUtil textField:textField shouldChangeCharactersInRange:range replacementString:string withMaxCount:self.fieldLength];
}
@end
