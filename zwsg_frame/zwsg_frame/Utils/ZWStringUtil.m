//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWStringUtil.m 
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

#import "ZWStringUtil.h"

@implementation ZWStringUtil
//判断是否为纯数字
+(BOOL)isAllNums:(NSString *)str{
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(str.length > 0)
    {
        return NO;
    }
    return YES;
}
//判空
+(BOOL)isNullOrEmpty:(NSString *)str{
    if (str==nil||[str isKindOfClass:[NSNull class]]||[self trim:str].length<=0)
    {
        return YES;
    }else{
        if([str isEqualToString:@"<NSNull>"]||[str isEqualToString:@"<null>"])
        {
            return YES;
        }else{
            return NO;
        }
    }
}
+(NSString*)trim:(NSString*)str{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
//身份证号验证
+(BOOL)isIDCardNum:(NSString *)str{
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    if (!str)
    {
        return NO;
    }
    else
    {
        length = str.length;
        if (length !=15 && length !=18)
        {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41",@"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    NSString *valueStart2 = [str substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray)
    {
        if ([areaCode isEqualToString:valueStart2])
        {
            areaFlag =YES;
            break;
        }
    }
    if (!areaFlag)
    {
        return false;
    }
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    int year =0;
    switch (length)
    {
        case 15:
            year = [str substringWithRange:NSMakeRange(6,2)].intValue +1900;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0))
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            else
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:str
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, str.length)];
            if(numberofMatch >0)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        case 18:
            year = [str substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0))
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}(19|20|21)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            else
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}(19|20|21)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:str
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, str.length)];
            if(numberofMatch >0)
            {
                int S = ([str substringWithRange:NSMakeRange(0,1)].intValue + [str substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([str substringWithRange:NSMakeRange(1,1)].intValue + [str substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([str substringWithRange:NSMakeRange(2,1)].intValue + [str substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([str substringWithRange:NSMakeRange(3,1)].intValue + [str substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([str substringWithRange:NSMakeRange(4,1)].intValue + [str substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([str substringWithRange:NSMakeRange(5,1)].intValue + [str substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([str substringWithRange:NSMakeRange(6,1)].intValue + [str substringWithRange:NSMakeRange(16,1)].intValue) *2 + [str substringWithRange:NSMakeRange(7,1)].intValue *1 + [str substringWithRange:NSMakeRange(8,1)].intValue *6 + [str substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位 大写X
                
                NSString *m = @"f";
                NSString *jym = @"10x98765432";
                m = [jym substringWithRange:NSMakeRange(Y,1)];// 判断校验位 小写x
                
                if ([M isEqualToString:[str substringWithRange:NSMakeRange(17,1)]] || [m isEqualToString:[str substringWithRange:NSMakeRange(17,1)]])
                {
                    return YES;// 检测ID的校验位
                }
                else
                {
                    return NO;
                }
            }
            else
            {
                return NO;
            }
        default:
            return false;
    }
}
//手机号验证
+ (BOOL)isMobile:(NSString *)str{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181(增加)
     */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181(增加)
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:str]
         || [regextestcm evaluateWithObject:str]
         || [regextestct evaluateWithObject:str]
         || [regextestcu evaluateWithObject:str]))
    {
        return YES;
    }
    return NO;
}
//固话验证
+ (BOOL)isTel:(NSString *)str{
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextesTel = [NSPredicate predicateWithFormat:@"SELF     MATCHES %@", PHS];
    if ([regextesTel evaluateWithObject:str]) {
        return YES;
    }else{
        return NO;
    }
}
//邮箱验证
+ (BOOL)isEmail:(NSString *)str{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:str];
}
//车牌号验证
+ (BOOL)isCarNum:(NSString *)str{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:str];
}
//车架号验证
+ (BOOL)isCarFrameNum:(NSString *)str{
    NSString *carRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{17}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:str];
}
//邮编验证
+ (BOOL)isZipCode:(NSString *)str{
    NSString *carRegex = @"^[0-9]{6}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:str];
}
//是否是图片
+ (BOOL)isPicture:(NSString *)str{
    if ([str hasSuffix:@".png"] || [str hasSuffix:@".jpg"] || [str hasSuffix:@".jpeg"] || [str hasSuffix:@".gif"] || [str hasSuffix:@".bmp"])
    {
        return YES;
    }
    return NO;
}
//是否为视频
+ (BOOL)isVideo:(NSString *)str
{
    if ([str hasSuffix:@".mp4"] || [str hasSuffix:@".avi"] || [str hasSuffix:@".mov"] || [str hasSuffix:@".rmvb"] || [str hasSuffix:@".3gp"] || [str hasSuffix:@".mkv"] || [str hasSuffix:@".wmv"])
    {
        return YES;
    }
    return NO;
}
@end
