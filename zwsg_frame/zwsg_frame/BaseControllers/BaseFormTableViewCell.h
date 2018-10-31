//___HEADERFILE___
/*
 * zwsg_frame 
 * BaseFormTableViewCell.h 
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

#import <UIKit/UIKit.h>
@class BaseViewController;
@interface BaseFormTableViewCell : UITableViewCell
@property(nonatomic,strong) BaseViewController *controller;//传值当前控制器，在cell中即可获取当前控制器
@property(assign,nonatomic) NSInteger cellHeigh;//cell高度
@property (strong, nonatomic) NSString* value;//显示的值
@property (strong, nonatomic) NSString* cellValue;//传给后台的值
@property (strong, nonatomic) NSString* keyboardType;//文本类型 IDNum=身份证 Phone=手机 Tel=固话
@property (strong, nonatomic) UIView *valueView;//显示value的view
@property (strong, nonatomic) UILabel *lblName;//标题
@property (copy, nonatomic)   NSString *placeHolder;//默认提示
@property (copy, nonatomic) NSString *key;//键
@property (copy, nonatomic) NSString *title;//标题
@property (assign, nonatomic)  BOOL isRequire;//是否必填
@property (assign, nonatomic)  NSInteger fieldLength;//字段长度限制
@property (nonatomic,copy) NSString *iconPath;//icon
/*
 *初始化(无icon)
 */
//标题
-(instancetype)initTitle:(NSString*)title;
//标题、键
-(instancetype)initTitle:(NSString*)title key:(NSString*)key;
//标题、键、默认提示
-(instancetype)initTitle:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder;
//标题、键、是否必填
-(instancetype)initTitle:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire;
//标题、键、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key keyboardType:(NSString*)keyboardType;
//标题、键、是否必填、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire keyboardType:(NSString*)keyboardType;
//标题、键、最大限制字数
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length;
//标题、键、最大限制字数、是否必填
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length isRequire:(BOOL)isRequire;
//标题、键、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title key:(NSString*)key length:(NSInteger)length keyboardType:(NSString*)keyboardType;
//标题、值
-(instancetype)initTitle:(NSString*)title value:(NSString*)value;
//标题、值、键
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key;
//标题、值、键、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder;
//标题、值、键、传给后台值
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue;
//标题、值、键、传给后台值、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder cellValue:(NSString*)cellValue;
//标题、值、键、是否必填
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire;
//标题、值、键、传给后台值、是否必填
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire;
//标题、值、键、是否必填、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder;
//标题、值、键、传给后台值、是否必填、默认提示
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder;
//标题、值、键、是否必填、默认提示、最大限制字数
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length;
//标题、值、键、传给后台值、是否必填、默认提示、最大限制字数
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length;
//标题、值、键、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType;
//标题、值、键、传给后台值、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initTitle:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType;
/*
 *初始化(有icon)
 */
//icon、标题
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title;
//icon、标题、键
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key;
//icon、标题、键、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder;
//icon、标题、键、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key isRequire:(BOOL)isRequire;
//icon、标题、键、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key keyboardType:(NSString*)keyboardType;
//icon、标题、键、默认提示、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title key:(NSString*)key placeHolder:(NSString*)placeHolder keyboardType:(NSString*)keyboardType;
//icon、标题、值
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value;
//icon、标题、值、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value placeHolder:(NSString*)placeHolder;
//icon、标题、值、键
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key;
//icon、标题、值、键、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key placeHolder:(NSString*)placeHolder;
//icon、标题、值、键、传给后台值
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue;
//icon、标题、值、键、传给后台值、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue placeHolder:(NSString*)placeHolder;
//icon、标题、值、键、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire;
//icon、标题、值、键、传给后台值、是否必填
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire;
//icon、标题、值、键、是否必填、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder;
//icon、标题、值、键、传给后台值、是否必填、默认提示
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder;
//icon、标题、值、键、是否必填、默认提示、最大限制字数
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length;
//icon、标题、值、键、传给后台值、是否必填、默认提示、最大限制字数
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length;
//icon、标题、值、键、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType;
//icon、标题、值、键、传给后台值、是否必填、默认提示、最大限制字数、键盘类型
-(instancetype)initIcon:(NSString*)icon title:(NSString*)title value:(NSString*)value key:(NSString*)key cellValue:(NSString*)cellValue isRequire:(BOOL)isRequire placeHolder:(NSString*)placeHolder length:(NSInteger)length keyboardType:(NSString*)keyboardType;
@end
