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
@interface TextViewCell ()<UITextViewDelegate>{
    UITextView *textView;
    UILabel *cueLbl;
}
@end
@implementation TextViewCell

-(void)setUI{
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(FORM_PADDING_LEFT, 0, FORM_TITLE_WIDTH, 0)];
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
    textView.delegate = self;
    self.valueView=textView;
    textView.text = self.value;
    [self.contentView addSubview:textView];
    textView.centerY = self.centerY;
    //提示语
    cueLbl = [[UILabel alloc] initWithFrame:CGRectMake(5, 6, textView.width-10, 20)];
    if ([ZWStringUtil isNullOrEmpty:self.value]){
        cueLbl.hidden = NO;
    }else{
        cueLbl.hidden = YES;
    }
    if([ZWStringUtil isNullOrEmpty:self.placeHolder]){
        cueLbl.text=[NSString stringWithFormat:@"请输入%@",self.title];
    }else{
        cueLbl.text=self.placeHolder;
    }
    cueLbl.numberOfLines = 0;
    cueLbl.textColor = [UIColor colorWithHexString:COLR_PLACEHOLDER];
    cueLbl.font = [UIFont systemFontOfSize:FONT_SIZE_DEFAULT];
    [textView addSubview:cueLbl];
}
-(instancetype)initTitle:(NSString *)title key:(NSString *)key{
    if (self = [super initTitle:title key:key]) {
        [self setUI];
    }
    return self;
}

//设置cellValue
-(void)setCellValue:(NSString *)cellValue{
    self.cellValue=cellValue;
    textView.text=cellValue;
}

-(NSString*)cellValue{
    self.cellValue=textView.text;
    return self.cellValue;
}

//字数限制
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    return [ZWTextViewUtil textView:textView shouldChangeTextInRange:range replacementText:text withMaxCount:self.fieldLength];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        cueLbl.hidden = NO;
    }
    else
    {
        cueLbl.hidden = YES;
    }
    
    [ZWTextViewUtil textViewDidChange:textView withMaxCount:self.fieldLength];
}

@end
