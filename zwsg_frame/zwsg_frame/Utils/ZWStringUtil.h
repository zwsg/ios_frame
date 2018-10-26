//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWStringUtil.h 
 * Created by xhb on 2018/8/29. 
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

#import <Foundation/Foundation.h>

@interface ZWStringUtil : NSObject
//判断字符串是否为纯数字
+ (BOOL)isAllNums:(NSString *)str;
//判空
+ (BOOL)isNullOrEmpty:(NSString*) str;
//身份证号验证
+ (BOOL)isIDCardNum:(NSString *)str;
//手机号验证
+ (BOOL)isMobile:(NSString *)str;
//固话验证
+ (BOOL)isTel:(NSString *)str;
//邮箱验证
+ (BOOL)isEmail:(NSString *)str;
//车牌号验证
+ (BOOL)isCarNum:(NSString *)str;
//车架号验证
+ (BOOL)isCarFrameNum:(NSString *)str;
//邮编验证
+ (BOOL)isZipCode:(NSString *)str;
//是否是图片
+ (BOOL)isPicture:(NSString *)str;
//是否为视频
+ (BOOL)isVideo:(NSString *)str;
@end
