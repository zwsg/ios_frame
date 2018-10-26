//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWHelpUtil.m 
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

#import "ZWHelpUtil.h"

@implementation ZWHelpUtil
//获取验证码
+(void)getVerifyCodeWithBtn:(UIButton*)btn andParm:(NSDictionary*)parm{
    //    [HttpUtil Post:VerifyCode widthParm:parmDic widthSuccess:^(NSObject *result){
    //        //这里调用获取验证码的接口
    //        btn.userInteractionEnabled = NO;
    //        __block int timeout = 90; //倒计时时间  120
    //        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    //        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    //        dispatch_source_set_event_handler(_timer, ^{
    //            if(timeout<=0){ //倒计时结束，关闭
    //                dispatch_source_cancel(_timer);
    //                dispatch_async(dispatch_get_main_queue(), ^{
    //                    //设置界面的按钮显示 根据自己需求设置
    //                    btn.userInteractionEnabled = YES;
    //                    [btn setBackgroundColor:[UIColor colorWithHexString:COLR_MAIN_BLUE]];
    //                    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    //                });
    //            }else{
    //                dispatch_async(dispatch_get_main_queue(), ^{
    //                    //设置界面的按钮显示 根据自己需求设置
    //                    btn.userInteractionEnabled = NO;
    //                    [btn setBackgroundColor:[UIColor colorWithHexString:COLR_TEXT_GRAY]];
    //                    [btn setTitle:[NSString stringWithFormat:@"%ds后获取",timeout] forState:UIControlStateNormal];
    //                });
    //                timeout--;
    //            }
    //        });
    //        dispatch_resume(_timer);
    //
    //        NSString *msgStr = [NSString stringWithFormat:@"%@",result];
    //        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"验证码" message:msgStr preferredStyle:UIAlertControllerStyleAlert];
    //        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    //
    //        }]];
    //        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    //
    //    } widthEnd:^(NSString *end){
    //
    //    }];
}
//根据item总数以及每行item数量计算行数
+(NSInteger)getRowTotalWithItemCount:(NSInteger)itemCnt andRowItemCount:(NSInteger)rowItemCnt{
    CGFloat rowCnt = 0;
    if (itemCnt % rowItemCnt > 0)
    {
        rowCnt = itemCnt / rowItemCnt + 1;
    }else
    {
        rowCnt = itemCnt / rowItemCnt;
    }
    return rowItemCnt;
}
//获取当前控制器
+ (UIViewController *)getCurrentViewController {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //1、通过present弹出VC，appRootVC.presentedViewController不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        //2、通过navigationcontroller弹出VC
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    //1、tabBarController
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //或者 UINavigationController * nav = tabbar.selectedViewController;
        result = nav.childViewControllers.lastObject;
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        //2、navigationController
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{//3、viewControler
        result = nextResponder;
    }
    return result;
}
@end
