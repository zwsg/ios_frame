//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWTipsUtil.m 
 * Created by xhb on 2018/10/25. 
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

#import "ZWTipsUtil.h"
#import "JohnAlertManager.h"
#import "XLTieBarLoading.h"
@implementation ZWTipsUtil
//单例
+(instancetype)sharedUtil{
    static ZWTipsUtil *util = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = [[self alloc]init];
    });
    return util;
}
//成功提示
-(void)showSuccess:(NSString*)str{
    [[JohnAlertManager sharedManager] showSuccessAlert:@"成功!"];
}
//失败提示
-(void)showError:(NSString*)str{
    [[JohnAlertManager sharedManager] showFailedAlert:@"修改密码失败！"];
}
//warming
-(void)showWarm:(NSString*)str{
    [[JohnAlertManager sharedManager] showWarmAlert:@"警告!"];
}
//进度条
-(void)showProgress{
    [[XLTieBarLoading sharedLoading] showInView];
}
//消失
-(void)dismiss{
    [[XLTieBarLoading sharedLoading] hideInView];
}

@end
