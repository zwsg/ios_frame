//___HEADERFILE___
/*
 * zwsg_frame
 * AppConfig.h
 * Created by xhb on 2018/8/28.
 * QQ：692061841       WeChat：zwsg_wechat
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

#ifndef AppConfig_h
#define AppConfig_h
//是否是开发环境
#define IS_DEBUG YES
//appdelegate
#define app_delegate (AppDelegate*)[[UIApplication sharedApplication] delegate]
//登录缓存
#define LOGIN_USER (app_delegate).loginUser
//异步全局线程
#define kGlobalThread  dispatch_get_global_queue(0, 0)
//主线程
#define kMainThread  dispatch_get_main_queue()
//系统判断
#define IOS11 [[UIDevice currentDevice].systemVersion floatValue] >= 11.0
#define IOS10 [[UIDevice currentDevice].systemVersion floatValue] >= 10.0
#define IOS9 [[UIDevice currentDevice].systemVersion floatValue] >= 9.0
//屏幕宽高
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
//根据iphone6尺寸缩放
#define ZWScale(P)  ((P) * ([UIScreen mainScreen].bounds.size.width / 375.f))
//状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//底部安全距离
#define BottomSafeHeight   (CGFloat)(iPhoneX?(34):(0))
//导航栏高度
#define NavBarHeight 44.0
//tabbar高度
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//顶部高度，导航栏高度+状态栏高度
#define TopHeight (StatusBarHeight + NavBarHeight)
//判断iPhone尺寸
#define iPhone4 ([UIScreen mainScreen].bounds.size.height==480)&&([UIScreen mainScreen].bounds.size.width==320)
#define iPhone5 ([UIScreen mainScreen].bounds.size.height==568)&&([UIScreen mainScreen].bounds.size.width==320)
#define iPhone6 ([UIScreen mainScreen].bounds.size.height==667)&&([UIScreen mainScreen].bounds.size.width==375)
#define iPhone6p ([UIScreen mainScreen].bounds.size.height==736)&&([UIScreen mainScreen].bounds.size.width==414)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//颜色配置
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//主体背景色
#define COLR_MAIN @"#005C9C"
//背景颜色
#define COLR_BACKGROUND @""
//主标题颜色
#define COLR_MAIN_TITLE @""
//副标题颜色
#define COLR_SUB_TITLE @""
//分割线颜色
#define COLR_LINE @""
//placeholder颜色
#define COLR_PLACEHOLDER @""
//超小字体
#define FONT_SIZE_SMALL_SMAIL 10
//小字体
#define FONT_SIZE_SMALL 12
//默认字体
#define FONT_SIZE_DEFAULT 14
//大字体
#define FONT_SIZE_BIG 16
//表单行高
#define FORM_ITEM_HEIGHT 50
//表单元素左边距离
#define FORM_PADDING_LEFT 15
//表单标题宽度
#define FORM_TITLE_WIDTH 85
//表单实际控件距离标题控件距离
#define FORM_MARGIN_TO_TITLE 10

#endif /* AppConfig_h */
