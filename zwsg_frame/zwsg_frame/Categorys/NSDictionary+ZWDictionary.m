//___HEADERFILE___
/*
 * zwsg_frame 
 * NSDictionary+ZWDictionary.m 
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

#import "NSDictionary+ZWDictionary.h"

@implementation NSDictionary (ZWDictionary)
-(int)getInt:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return -1;
    }else
        if([@"<null>" isEqualToString:[self getString:@"key"]]){
            return -1;
        }
    return [(NSNumber*)obj intValue];
}
-(NSString*)getString:(NSString*)key{
    NSObject * obj=self[key];
    if(obj == nil || [obj isKindOfClass:[NSNull class]])
    {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",obj];
    }
}
-(NSNumber*)getNumber:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return 0;
    }else
        if([@"<null>" isEqualToString:[self getString:@"key"]]){
            return 0;
        }
    return (NSNumber*)obj;
}
-(NSString*)getString:(NSString*)key byDefaultVaule:(NSString*)value{
    NSObject * obj=self[key];
    if(obj == nil || [obj isKindOfClass:[NSNull class]])
    {
        return value;
    }else{
        return [NSString stringWithFormat:@"%@",obj];
    }
}
-(NSArray*)getArray:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return nil;
    }else{
        
        if([obj isKindOfClass:[NSArray class]]){
            return (NSArray*)obj;
        }else
            if([obj isKindOfClass:[NSMutableArray class]]){
                NSArray* arr=[NSArray arrayWithArray:(NSMutableArray*)obj];
                return arr;
            }else{
                return nil;
            }
    }
}
-(NSMutableArray*)getMutableArray:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return nil;
    }else{
        
        if([obj isKindOfClass:[NSMutableArray class]]){
            return (NSMutableArray*)obj;
        }else
            if([obj isKindOfClass:[NSArray class]]){
                NSMutableArray *arr = [NSMutableArray array];
                [arr addObjectsFromArray:(NSArray*)obj];
                return arr;
            }else{
                return nil;
            }
    }
}
-(NSDictionary*)getDictioary:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return nil;
    }else{
        return (NSDictionary*)obj;
    }
}
-(double)getDouble:(NSString*)key{
    NSObject * obj = self[key];
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return 0;
    }else
        if([@"<null>" isEqualToString:[self getString:@"key"]]){
            return 0;
        }
    return [(NSNumber*)obj doubleValue];
}
-(BOOL)getBoolen:(NSString*)key{
    BOOL obj = [[self objectForKey:key] boolValue];
    return obj;
}
-(NSMutableDictionary*)getMutableDictioary:(NSString*)key{
    NSObject * obj = self[key];
    NSMutableDictionary* d=nil;
    if(obj==nil || [obj isKindOfClass:[NSNull class]]){
        return nil;
    }else{
        if([obj isKindOfClass:[NSMutableDictionary class]])
        {
            d= (NSMutableDictionary*)obj;
        }else
            if([obj isKindOfClass:[NSDictionary class]]){
                d=[NSMutableDictionary dictionaryWithDictionary:(NSDictionary*)obj];
                
            }
    }
    return d;
}
@end
