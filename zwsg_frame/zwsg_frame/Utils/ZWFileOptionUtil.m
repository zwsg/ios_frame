//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWFileOptionUtil.m 
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

#import "ZWFileOptionUtil.h"

@implementation ZWFileOptionUtil
//图片大小设置
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}
//宽高比例重新获取size
+(CGSize)get_ImageCompressionProportion:(UIImage *)image{
    CGSize size = image.size;
    CGFloat HBL = screenHeight / size.height;
    CGFloat WBL = screenWidth / size.width;
    
    if (size.width <= screenWidth && size.height <= screenHeight) {
        return size;
    }
    else if (size.width > screenWidth && size.height <= screenHeight) {
        size.width = screenWidth;
        size.height = size.height * WBL;
        NSString * str = [NSString stringWithFormat:@"%.0f",size.height];
        size.height = [str floatValue];
    }
    else if (size.height > screenHeight && size.width <= screenWidth) {
        size.height = screenHeight;
        size.width = size.width * HBL;
        NSString * str = [NSString stringWithFormat:@"%.0f",size.width];
        size.width = [str floatValue];
    }
    else if (size.height > screenHeight && size.width > screenWidth) {
        if (HBL < WBL) {
            size.height = screenHeight;
            size.width = size.width * HBL;
            NSString * str = [NSString stringWithFormat:@"%.0f",size.width];
            size.width = [str floatValue];
        }
        else
        {
            size.width = screenWidth;
            size.height = size.height * WBL;
            NSString * str = [NSString stringWithFormat:@"%.0f",size.height];
            size.height = [str floatValue];
        }
    }
    return size;
}
@end
