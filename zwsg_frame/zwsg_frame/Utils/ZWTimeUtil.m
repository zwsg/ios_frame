//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWTimeUtil.m 
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

#import "ZWTimeUtil.h"

@implementation ZWTimeUtil
//获取当前的时间
+ (NSString *)getCurrentTime:(NSString *)dateStr
{
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    timeFormat.dateFormat = dateStr;
    NSString *nowStr = [timeFormat stringFromDate:date];
    
    return nowStr;
}

+ (NSString *)getYesterday
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay fromDate:currentDate];
    [dateComponents setDay:-1];
    NSDate *mouthDate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *yearStr = [formatter stringFromDate:mouthDate];
    
    return yearStr;
}

+ (NSString *)getAYearAgo:(NSString *)formatterStr
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear fromDate:currentDate];
    [dateComponents setYear:-1];
    NSDate *mouthDate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterStr];
    NSString *yearStr = [formatter stringFromDate:mouthDate];
    
    return yearStr;
}

+ (NSString *)computeDateWithYears:(NSString *)timeStr andFormatterStr:(NSString *)formatterStr
{
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:formatterStr];
    NSDate *myDate = [dateFormatter dateFromString:timeStr];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear fromDate:myDate];
    [dateComponents setYear:+1];
    NSDate *newDate = [calendar dateByAddingComponents:dateComponents toDate:myDate options:0];
    return [dateFormatter stringFromDate:newDate];
}

+ (NSString *)getHalfAYearAgo
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
    [dateComponents setMonth:-6];
    NSDate *mouthDate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *mouthStr = [formatter stringFromDate:mouthDate];
    return mouthStr;
}

+ (NSString *)getAMouthAgo
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
    [dateComponents setMonth:-1];
    NSDate *mouthDate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *mouthStr = [formatter stringFromDate:mouthDate];
    return mouthStr;
}

+ (NSTimeInterval)getTimeIntervalWithStartStr:(NSString *)startStr andEndStr:(NSString *)endStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *startD = [dateFormatter dateFromString:startStr];
    NSTimeInterval startT = [startD timeIntervalSince1970];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *endD = [dateFormatter1 dateFromString:endStr];
    NSTimeInterval endT = [endD timeIntervalSince1970];
    NSTimeInterval cha = endT - startT;
    return cha;
}

#pragma mark - 把时间戳转换成时间字符串
+ (NSString *)timeStrWithTimeInterval:(NSString *)timeString withStyle:(NSString *)style
{
    NSString* dateString = @"";
    
    if ([timeString integerValue] > 0)
    {
        // 格式化时间
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:style];
        
        // 毫秒值转化为秒
        NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
        dateString = [formatter stringFromDate:date];
    }
    
    return dateString;
}
+ (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
}
#pragma mark - 把时间字符串转换成时间戳
+ (NSString*)timeToTimeStamp:(NSString *)timeStr withFormat:(NSString *)timeFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:timeFormat];
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *date = [formatter dateFromString:timeStr]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    CGFloat timeStamp = [date timeIntervalSince1970]*1000; // *1000 是精确到毫秒，不乘就是精确到秒
    
    return [NSString stringWithFormat:@"%.0f",timeStamp];
}

+ (NSString *)distanceTimeWithBeforeTime:(double)time
{
    NSString * distanceStr = @"";
    if (time > 0)
    {
        double beTime=time/1000;
        NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
        double distanceTime = now - beTime;
        
        NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
        NSDateFormatter * df = [[NSDateFormatter alloc]init];
        [df setDateFormat:@"HH:mm"];
        NSString * timeStr = [df stringFromDate:beDate];
        
        [df setDateFormat:@"dd"];
        NSString * nowDay = [df stringFromDate:[NSDate date]];
        NSString * lastDay = [df stringFromDate:beDate];
        
        if (distanceTime < 60) {//小于一分钟
            distanceStr = @"刚刚";
        }
        else if (distanceTime <60*60) {//时间小于一个小时
            distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
        }
        else if(distanceTime <24*60*60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
            distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
        }
        else if(distanceTime<24*60*60*2 && [nowDay integerValue] != [lastDay integerValue]){
            
            if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
                distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
            }
            else{
                [df setDateFormat:@"MM-dd HH:mm"];
                distanceStr = [df stringFromDate:beDate];
            }
            
        }
        else if(distanceTime <24*60*60*365){
            [df setDateFormat:@"MM-dd HH:mm"];
            distanceStr = [df stringFromDate:beDate];
        }
        else{
            [df setDateFormat:@"yyyy-MM-dd HH:mm"];
            distanceStr = [df stringFromDate:beDate];
        }
    }
    
    return distanceStr;
}

+ (NSTimeInterval)getTimeIntervalWithStartT:(NSString *)startT andEndT:(NSString *)endT
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm:ss";
    NSDate *startD = [dateFormatter dateFromString:startT];
    NSTimeInterval startTime = [startD timeIntervalSince1970];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.dateFormat = @"HH:mm:ss";
    NSDate *endD = [dateFormatter1 dateFromString:endT];
    NSTimeInterval endTime = [endD timeIntervalSince1970];
    NSTimeInterval cha = endTime - startTime;
    return cha;
}
//当前时间星期几
+ (NSString *)getCurrentTimeWithWeek
{
    NSDate *date = [[NSDate alloc] init];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone:timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    NSString *weekStr = [weekdays objectAtIndex:theComponents.weekday];
    return weekStr;
}
@end
