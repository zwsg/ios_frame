//
//  ZWHttpUtil.m
//  ZHJWEQ
//
//  Created by xhb on 2018/9/6.
//  Copyright © 2018年 ZW. All rights reserved.
//

#import "ZWHttpUtil.h"
#import "AFNetworking.h"
@implementation ZWHttpUtil
+(NSMutableDictionary *)getCommParm{
    NSMutableDictionary * mutableDic=[NSMutableDictionary dictionary];
    [mutableDic setValue:@"api_key" forKey:@"apiKey"];
    [mutableDic setValue:@"api_secret" forKey:@"apiSecret"];
    [mutableDic setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"version"];
    [mutableDic setValue:@"Wifi" forKey:@"netType"];
    [mutableDic setValue:@"ios" forKey:@"osid"];
    [mutableDic setValue:@"4b27f21b15938224c22b4d041d2b3442" forKey:@"token"];
    [mutableDic setValue:@"8888" forKey:@"imei"];
    return mutableDic;
}
+(NSString*)getParmStr:(NSDictionary*)parm{
    NSString * str=@"";
    if(parm!=nil){
        for (int i=0; i<parm.count; i++) {
            if(i==0){
                str=[str stringByAppendingFormat:@"%@=%@",parm.allKeys[i],parm[parm.allKeys[i]]];
            }else{
                str=[str stringByAppendingFormat:@"&%@=%@",parm.allKeys[i],parm[parm.allKeys[i]]];
            }
        }
    }
    return str;
}
+(void)Post:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end{
    NSMutableDictionary * mutableDic=[NSMutableDictionary dictionary];
    if(parm==nil){
        mutableDic=[NSMutableDictionary dictionary];
    }else{
        mutableDic=[[NSMutableDictionary alloc]initWithDictionary:parm];
    }
    NSMutableDictionary * d=[ZWHttpUtil getCommParm];
    [mutableDic setValuesForKeysWithDictionary:d];
    url = [url stringByAppendingString:@"?t=126556"];
    if (LOGIN_USER) {
        [mutableDic setObject:@([LOGIN_USER getInt:@"id"]) forKey:@"userId"];
    }
    if (mutableDic.allKeys.count != 0) {
        url=[url stringByAppendingFormat:@"&%@",[ZWHttpUtil getParmStr:mutableDic]];
        NSString * strParm= [ZWJsonUtil dictionaryToJson:mutableDic];
        NSLog(@"参数:%@",strParm);
    }
    NSLog(@"url:%@",url);
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager * httpManager=[AFHTTPSessionManager manager];
    httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
    httpManager.requestSerializer =[AFJSONRequestSerializer serializer];
        httpManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    httpManager.requestSerializer.timeoutInterval = 10;
    [[ZWTipsUtil sharedUtil] showProgress];
    [httpManager POST:url parameters:mutableDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[ZWTipsUtil sharedUtil] dismiss];
        NSDictionary* jsonResult=(NSDictionary *)responseObject;
        NSLog(@"%@",jsonResult.description);
        NSInteger statu= [jsonResult getInt:@"status"];
        if (statu == 1) //成功
        {
            result(jsonResult[@"data"]);
        }
        else
        {
            [[ZWTipsUtil sharedUtil]showError:[jsonResult getString:@"info"]];
            faild(jsonResult.description);
        }
        
        end(jsonResult.description);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[ZWTipsUtil sharedUtil] dismiss];
        [[ZWTipsUtil sharedUtil] showWarm:@"网络错误,请检查网络！"];
        faild(error.description);
        end(error.description);
    }];
}
+(void)PostNoProgress:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end{
    NSMutableDictionary * mutableDic=[NSMutableDictionary dictionary];
    if(parm==nil){
        mutableDic=[NSMutableDictionary dictionary];
    }else{
        mutableDic=[[NSMutableDictionary alloc]initWithDictionary:parm];
    }
    NSMutableDictionary * d=[ZWHttpUtil getCommParm];
    [mutableDic setValuesForKeysWithDictionary:d];
    url = [url stringByAppendingString:@"?t=126556"];
    if (LOGIN_USER) {
        [mutableDic setObject:@([LOGIN_USER getInt:@"id"]) forKey:@"userId"];
    }
    if (mutableDic.allKeys.count != 0) {
        url=[url stringByAppendingFormat:@"&%@",[ZWHttpUtil getParmStr:mutableDic]];
        NSString * strParm= [ZWJsonUtil dictionaryToJson:mutableDic];
        NSLog(@"参数:%@",strParm);
    }
    NSLog(@"url:%@",url);
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager * httpManager=[AFHTTPSessionManager manager];
    httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
    httpManager.requestSerializer =[AFJSONRequestSerializer serializer];
    httpManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    httpManager.requestSerializer.timeoutInterval = 10;
    [httpManager POST:url parameters:mutableDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonResult=(NSDictionary *)responseObject;
        NSLog(@"%@",jsonResult.description);
        NSInteger statu= [jsonResult getInt:@"status"];
        if (statu == 1) //成功
        {
            result(jsonResult[@"data"]);
        }
        else
        {
            faild(jsonResult.description);
        }
        
        end(jsonResult.description);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faild(error.description);
        end(error.description);
    }];
}
+(void)Get:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end{
    
    NSMutableDictionary * mutableDic=[NSMutableDictionary dictionary];
    if(parm==nil){
        mutableDic=[NSMutableDictionary dictionary];
    }else{
        mutableDic=[[NSMutableDictionary alloc]initWithDictionary:parm];
    }
    
    [mutableDic setValuesForKeysWithDictionary:[ZWHttpUtil getCommParm]];
    url = [url stringByAppendingString:@"?t=126556"];
    NSString * resultURL=url;
    if (mutableDic.allKeys.count != 0) {
        resultURL=[resultURL stringByAppendingFormat:@"&%@",[ZWHttpUtil getParmStr:mutableDic]];
    }
    NSLog(@"%@",resultURL);
    AFHTTPSessionManager * httpManager=[AFHTTPSessionManager manager];
    httpManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    httpManager.requestSerializer.timeoutInterval = 10;
    [[ZWTipsUtil sharedUtil] showProgress];
    [httpManager GET:resultURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonResult=(NSDictionary *)responseObject;
        NSLog(@"%@",jsonResult.description);
        [[ZWTipsUtil sharedUtil] dismiss];
        NSInteger statu= [jsonResult getInt:@"success"];
        if (statu == 1) //成功
        {
            result(jsonResult[@"data"]);
        }
        else
        {
            [[ZWTipsUtil sharedUtil] showError:[jsonResult getString:@"info"]];
            faild(jsonResult.description);
        }
        end(jsonResult.description);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[ZWTipsUtil sharedUtil] dismiss];
        [[ZWTipsUtil sharedUtil] showWarm:@"网络错误,请检查网络！"];
        
        faild(error.description);
        
         end(error.description);
    }];
}
+(void)GetNoProgress:(NSString*)url widthParm:(NSDictionary*)parm widthSuccess:(void (^)(NSObject*result))result withFaild:(void (^)(NSString*faild))faild widthEnd:(void (^)(NSString*end))end{
    NSMutableDictionary * mutableDic=[NSMutableDictionary dictionary];
    if(parm==nil){
        mutableDic=[NSMutableDictionary dictionary];
    }else{
        mutableDic=[[NSMutableDictionary alloc]initWithDictionary:parm];
    }
    
    [mutableDic setValuesForKeysWithDictionary:[ZWHttpUtil getCommParm]];
    url = [url stringByAppendingString:@"?t=126556"];
    NSString * resultURL=url;
    if (mutableDic.allKeys.count != 0) {
        resultURL=[resultURL stringByAppendingFormat:@"&%@",[ZWHttpUtil getParmStr:mutableDic]];
    }
    NSLog(@"%@",resultURL);
    AFHTTPSessionManager * httpManager=[AFHTTPSessionManager manager];
    httpManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    httpManager.requestSerializer.timeoutInterval = 10;
    [httpManager GET:resultURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonResult=(NSDictionary *)responseObject;
        NSLog(@"%@",jsonResult.description);
        NSInteger statu= [jsonResult getInt:@"success"];
        if (statu == 1) //成功
        {
            result(jsonResult[@"data"]);
        }
        else
        {
            [[ZWTipsUtil sharedUtil] showError:[jsonResult getString:@"info"]];
            faild(jsonResult.description);
        }
        end(jsonResult.description);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[ZWTipsUtil sharedUtil] showWarm:@"网络错误,请检查网络！"];
        faild(error.description);
        end(error.description);
    }];
}
@end
