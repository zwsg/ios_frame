//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWWordWrapUtil.h 
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

#import <Foundation/Foundation.h>

@interface ZWWordWrapUtil : NSObject
//自适应高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label AndWidth:(CGFloat)width;

//自适应宽度
+(CGFloat)adaptionWidthWithLabel:(UILabel*)label AndHeight:(CGFloat)height;

//自适应高度 有个最小的高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label andWidth:(CGFloat)width andMinHeight:(CGFloat)minHeight;

//自适应高度 有个最大的高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label andWidth:(CGFloat)width andMaxHeight:(CGFloat)maxHeight;

//自适应宽度 有个最大的宽度
+(CGFloat)adaptionWidthWithLabel:(UILabel*)label AndHeight:(CGFloat)height andMaxWidth:(CGFloat)maxWidth;
@end
