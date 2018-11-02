//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWTimeUtil.h 
 * Created by xhb on 2018/10/26. 
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

@interface ZWTimeUtil : NSObject
// 当前时间
+ (NSString *)getCurrentTime:(NSString *)dateStr;
// 昨天
+ (NSString *)getYesterday;
// 过去一年
+ (NSString *)getAYearAgo:(NSString *)formatterStr;
// 未来一年
+ (NSString *)computeDateWithYears:(NSString *)timeStr andFormatterStr:(NSString *)formatterStr;
// 过去半年
+ (NSString *)getHalfAYearAgo;
// 过去一个月
+ (NSString *)getAMouthAgo;
// 两个时间的时间差
+ (NSTimeInterval)getTimeIntervalWithStartStr:(NSString *)startStr andEndStr:(NSString *)endStr;
// 时间戳转化为时间字符串
+(NSString *)timeStrWithTimeInterval:(NSString *)timeString withStyle:(NSString *)style;
// 日期转化为时间字符串
+(NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat;
//距离当前时间，例如：三分钟前……
+(NSString *)distanceTimeWithBeforeTime:(double)beTime;
// 两个时间的时间差 格式HH:mm:ss
+ (NSTimeInterval)getTimeIntervalWithStartT:(NSString *)startT andEndT:(NSString *)endT;
// 当前时间是星期几
+ (NSString *)getCurrentTimeWithWeek;
// 时间字符串转化为时间戳
+ (NSString*)timeToTimeStamp:(NSString *)timeStr withFormat:(NSString *)timeFormat;
@end
