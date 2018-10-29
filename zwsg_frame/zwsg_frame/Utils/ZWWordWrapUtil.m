//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWWordWrapUtil.m 
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

#import "ZWWordWrapUtil.h"

@implementation ZWWordWrapUtil
//自适应高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label AndWidth:(CGFloat)width{
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return [label.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.height;
}

//自适应宽度
+(CGFloat)adaptionWidthWithLabel:(UILabel*)label AndHeight:(CGFloat)height{
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    return [label.text boundingRectWithSize:CGSizeMake(1000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.width;
}

//自适应高度 有个最小的高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label andWidth:(CGFloat)width andMinHeight:(CGFloat)minHeight{
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    if ([label.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.height<minHeight) {
        return minHeight;
    }
    return [label.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.height;
}

//自适应高度 有个最大的高度
+(CGFloat)adaptionHeightWithLabel:(UILabel*)label andWidth:(CGFloat)width andMaxHeight:(CGFloat)maxHeight{
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    CGFloat myHeight = [label.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.height;
    if (myHeight > maxHeight)
    {
        myHeight = maxHeight;
    }
    
    return myHeight;
}

//自适应宽度 有个最大的宽度
+(CGFloat)adaptionWidthWithLabel:(UILabel*)label AndHeight:(CGFloat)height andMaxWidth:(CGFloat)maxWidth{
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    if ([label.text boundingRectWithSize:CGSizeMake(1000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.width>maxWidth) {
        return maxWidth;
    }
    return [label.text boundingRectWithSize:CGSizeMake(1000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size.width;
}
@end
