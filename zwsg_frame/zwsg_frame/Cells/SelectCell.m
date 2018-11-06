//___HEADERFILE___
/*
 * zwsg_frame 
 * SelectCell.m 
 * Created by xhb on 2018/11/1. 
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

#import "SelectCell.h"
@interface SelectCell (){
    UILabel *selectLbl;
}
@end
@implementation SelectCell

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
    
    selectLbl = [[UILabel alloc]initWithFrame:CGRectMake(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER, 0, screenWidth-(lblTitle.x+lblTitle.width+FORM_SPACE_CENTER)-FORM_PADDING_LEFT-20, self.cellHeigh)];
    selectLbl.centerY=self.centerY;
    selectLbl.font= [UIFont systemFontOfSize:FONT_SIZE_DEFAULT];
    selectLbl.textColor = [UIColor colorWithHexString:COLR_SUB_TITLE];
    selectLbl.numberOfLines = 0;
    selectLbl.lineBreakMode = NSLineBreakByTruncatingTail;
    if (![ZWStringUtil isNullOrEmpty:self.value]) {
        selectLbl.text = self.value;
    }else{
        if ([ZWStringUtil isNullOrEmpty:self.placeHolder]) {
            selectLbl.text = [NSString stringWithFormat:@"请选择%@",self.title];
        }else{
            selectLbl.text = self.placeHolder;
        }
        selectLbl.textColor = [UIColor colorWithHexString:COLR_PLACEHOLDER];
    }
    self.valueView=selectLbl;
    [self.contentView addSubview:selectLbl];
    self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self.contentView addGestureRecognizer:tapGesture];
    
    if ([ZWStringUtil isNullOrEmpty:self.cellValue]) {
        self.cellValue = self.value;
    }
}
-(instancetype)initTitle:(NSString *)title key:(NSString *)key{
    if (self = [super initTitle:title key:key]) {
        [self setUI];
    }
    return self;
}
-(instancetype)initTitle:(NSString *)title value:(NSString *)value key:(NSString *)key{
    if (self = [super initTitle:title value:value key:key]) {
        [self setUI];
    }
    return self;
}
-(instancetype)initTitle:(NSString *)title value:(NSString *)value key:(NSString *)key cellValue:(NSString *)cellValue{
    if (self = [super initTitle:title value:value key:key cellValue:cellValue]) {
        [self setUI];
    }
    return self;
}
-(void)click{
    self.selectBlock(self,self.valueView);
}
-(instancetype)setClick:(SelectBlock)selectBlock{
    _selectBlock=selectBlock;
    return self;
}
@end
