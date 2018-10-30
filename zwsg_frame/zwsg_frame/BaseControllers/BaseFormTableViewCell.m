//___HEADERFILE___
/*
 * zwsg_frame 
 * BaseFormTableViewCell.m 
 * Created by xhb on 2018/10/30. 
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

#import "BaseFormTableViewCell.h"

@implementation BaseFormTableViewCell
-(void)midInit{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.height=self.cellHeigh=FORM_ITEM_HEIGHT;
    self.isRequire=YES;//默认是必填
    self.fieldLength=20;
}

-(instancetype)init{
    self=[super init];
    if(self){
        [self midInit];
    }
    return self;
}

/*
 *初始化(无icon)
 */
//标题
-(instancetype)initTitle:(NSString*)title{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
    }
    return self;
}
//标题、键
-(instancetype)initTitle:(NSString*)title key:(NSString*)key{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
    }
    return self;
}
//标题、键、默认提示
-(instancetype)initTitle:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.placeHolder = placeHolder;
    }
    return self;
}
//标题、键、是否必填
-(instancetype)initTitle:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.isRequire = isRequire;
    }
    return self;
}
//标题、键、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.keyboardType = keyboardType;
    }
    return self;
}
//标题、键、是否必填、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.isRequire = isRequire;
        self.keyboardType = keyboardType;
    }
    return self;
}
//标题、键、最大限制字数
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.fieldLength = length;
    }
    return self;
}
//标题、键、最大限制字数、是否必填
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.fieldLength = length;
        self.isRequire = isRequire;
    }
    return self;
}
//标题、键、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.key = key;
        self.fieldLength = length;
        self.keyboardType = keyboardType;
    }
    return self;
}
//标题、值
-(instancetype)initTitle:(NSString*)title value:(NSString*)value{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
    }
    return self;
}
//标题、值、键
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
    }
    return self;
}
//标题、值、键、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.placeHolder = placeHolder;
    }
    return self;
}
//标题、值、键、传给后台值
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.cellValue = cellValue;
        self.key = key;
    }
    return self;
}
//标题、值、键、传给后台值、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder cellValue:(NSString*)cellValue{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.cellValue = cellValue;
        self.key = key;
        self.placeHolder = placeHolder;
    }
    return self;
}
//标题、值、键、是否必填
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
    }
    return self;
}
//标题、值、键、传给后台值、是否必填
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.cellValue = cellValue;
        self.key = key;
        self.isRequire = isRequire;
    }
    return self;
}
//标题、值、键、是否必填、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
    }
    return self;
}
//标题、值、键、传给后台值、是否必填、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
    }
    return self;
}
//标题、值、键、是否必填、默认提示、最大限制字数
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
    }
    return self;
}
//标题、值、键、传给后台值、是否必填、默认提示、最大限制字数
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
    }
    return self;
}
//标题、值、键、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
        self.keyboardType = keyboardType;
    }
    return self;
}
//标题、值、键、传给后台值、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
        self.keyboardType = keyboardType;
    }
    return self;
}
/*
 *初始化(有icon)
 */
//icon、标题
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
    }
    return self;
}
//icon、标题、键
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.key = key;
    }
    return self;
}
//icon、标题、键、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.key = key;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、键、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.key = key;
        self.isRequire = isRequire;
    }
    return self;
}
//icon、标题、键、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.key = key;
        self.keyboardType = keyboardType;
    }
    return self;
}
//icon、标题、键、默认提示、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.key = key;
        self.placeHolder = placeHolder;
        self.keyboardType = keyboardType;
    }
    return self;
}
//icon、标题、值
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
    }
    return self;
}
//icon、标题、值、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、值、键
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
    }
    return self;
}
//icon、标题、值、键、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、值、键、传给后台值
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
    }
    return self;
}
//icon、标题、值、键、传给后台值、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、值、键、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
    }
    return self;
}
//icon、标题、值、键、传给后台值、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
    }
    return self;
}
//icon、标题、值、键、是否必填、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、值、键、传给后台值、是否必填、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
    }
    return self;
}
//icon、标题、值、键、是否必填、默认提示、最大限制字数
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
    }
    return self;
}
//icon、标题、值、键、传给后台值、是否必填、默认提示、最大限制字数
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
    }
    return self;
}
//icon、标题、值、键、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
        self.keyboardType = keyboardType;
    }
    return self;
}
//icon、标题、值、键、传给后台值、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType{
    if (self = [super init]) {
        [self midInit];
        self.iconPath = icon;
        self.title = title;
        self.value = value;
        self.key = key;
        self.cellValue = cellValue;
        self.isRequire = isRequire;
        self.placeHolder = placeHolder;
        self.fieldLength = length;
        self.keyboardType = keyboardType;
    }
    return self;
}
@end
