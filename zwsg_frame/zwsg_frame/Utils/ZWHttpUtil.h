//
//  ZWHttpUtil.h
//  ZHJWEQ
//
//  Created by xhb on 2018/9/6.
//  Copyright © 2018年 ZW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWHttpUtil : NSObject
+(NSMutableDictionary *)getCommParm;
+(NSString*)getParmStr:(NSDictionary*)parm;
+(void)Post:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end;
+(void)PostNoProgress:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result,NSString*page_count))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end;
+(void)Get:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end;
+(void)GetNoProgress:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end;
@end
