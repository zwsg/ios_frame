//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWLoginUtil.m 
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

#import "ZWLoginUtil.h"

@implementation ZWLoginUtil
//登录跳转到首页
+ (void)loginWithUserName:(NSString *)name withPassWord:(NSString*)psw{
//    NSDictionary *parm = @{@"user_name":name, @"password":psw};
//    typeof(self) __weak weakSelf = self;
//    [ZWHttpUtil Post:LOGIN widthParm:parm widthSuccess:^(NSObject *result) {
//        NSDictionary *dic = (NSDictionary *)result;
//        [weakSelf storeLoginData:dic withName:name withPsw:psw];
//        [weakSelf skipToFirstPage];
//    } withFaild:^(NSString *faild) {
//        
//    }widthEnd:^(NSString *end) {
//        
//    }];
}
//默默登录跳转到首页
+ (void)loginInBackground:(NSString *)name withPsw:(NSString*)psw andPushDic:(NSDictionary*)pushDic{
//    NSDictionary *parm = @{@"user_name":name, @"password":psw};
//    typeof(self) __weak weakSelf = self;
//    [ZWHttpUtil PostNoProgress:LOGIN widthParm:parm widthSuccess:^(NSObject *result,NSString *page_count) {
//        NSDictionary *dic = (NSDictionary *)result;
//        [weakSelf storeLoginData:dic withName:name withPsw:psw];
//        [weakSelf skipToFirstPage];
//        if(pushDic != nil) {//点击推送
//            [JPushOptionsUtil pushOptionByDic:pushDic];
//        }
//    } withFaild:^(NSObject *faild) {
//        [weakSelf skipToLogin];
//    } widthEnd:^(NSString *end) {
//
//    }];
}
//默默调用登录刷新用户信息
+(void)refreshUserInfo{
//    NSDictionary *parm = @{@"user_name":[LOGIN_USER getString:@"userName"], @"password":[LOGIN_USER getString:@"userPsw"]};
//    typeof(self) __weak weakSelf = self;
//    [ZWHttpUtil PostNoProgress:LOGIN widthParm:parm widthSuccess:^(NSObject *result,NSString *page_count) {
//        NSDictionary *dic = (NSDictionary *)result;
//        [weakSelf storeLoginData:dic withName:[LOGIN_USER getString:@"userName"] withPsw:[LOGIN_USER getString:@"userPsw"]];
//    } withFaild:^(NSObject *faild) {
//    } widthEnd:^(NSString *end) {
//
//    }];
}
//判断用户是否登录
+ (BOOL)isLogin{
    if (LOGIN_USER)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//跳到登录界面
- (void)skipToLogin
{
//    LoginViewController *viewController=[LoginViewController new];
//    AppDelegate* delegate = app_delegate;
//    delegate.window.rootViewController = viewController;
}

//跳到首页
- (void)skipToFirstPage
{
//    MainTabbarController *vc = [[MainTabbarController alloc]init];
//    MainNavController *nav = [[MainNavController alloc]initWithRootViewController:vc];
//    AppDelegate *delegate = app_delegate;
//    delegate.window.rootViewController = nav;
}

//存储登录返回信息
- (void)storeLoginData:(NSDictionary *)dic withName:(NSString *)name withPsw:(NSString*)psw
{
//    NSString *userStr = [JSONUtil dictionaryToJson:dic];
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setObject:userStr forKey:@"szzhUserInfo"];
//    [user setObject:name forKey:@"userName"];
//    [user setObject:psw forKey:@"userPsw"];
//    [user synchronize];
//    [JPUSHService setAlias:[LOGIN_USER getString:@"userId"] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//        if (iResCode == 0) {
//            NSLog(@"添加别名成功");
//        }
//    } seq:1];
}

@end
