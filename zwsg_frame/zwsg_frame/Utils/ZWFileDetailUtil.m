//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWFileDetailUtil.m 
 * Created by xhb on 2018/10/29. 
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

#import "ZWFileDetailUtil.h"
#import "GQImageVideoViewer.h"
@implementation ZWFileDetailUtil
+(void)fileDetailWithDataArr:(NSArray*)arr andIndex:(NSInteger)index{
    NSMutableArray *showImgArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < arr.count; i ++)
    {
        NSString *str = [NSString stringWithFormat:@"%@%@",BASE_URL_API,arr[i]];
        if ([ZWStringUtil isNullOrEmpty:arr[i]] || [ZWStringUtil isPicture:str]) {
            [showImgArr addObject:@{GQIsImageURL:@(YES),
                                    GQURLString:[NSURL URLWithString:str]}];
        }else if([ZWStringUtil isVideo:str]){
            [showImgArr addObject:@{GQIsImageURL:@(NO),
                                    GQURLString:[NSURL URLWithString:str]}];
        }else{
            [[ZWTipsUtil sharedUtil] showError:@"文件格式不正确!"];
            return;
        }
    }
    //    链式调用
    [GQImageVideoViewer sharedInstance]
    .dataArrayChain(showImgArr)
    .showIndexTypeChain(GQShowIndexTypeLabel)
    .selectIndexChain(index)
    .launchDirectionChain(GQLaunchDirectionBottom)
    .showViewChain([self mainWindow]);
}
+ (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}
@end
