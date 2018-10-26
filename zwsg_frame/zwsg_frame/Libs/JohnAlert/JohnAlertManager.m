//
//  JohnAlertManager.m
//  顶部提示框
//
//  Created by YuanQuanTech on 2016/11/11.
//  Copyright © 2016年 John Lai. All rights reserved.
//

#import "JohnAlertManager.h"
#import "JohnTopAlert.h"

@implementation JohnAlertManager
+(instancetype)sharedManager{
    static JohnAlertManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}
-(void)showSuccessAlert:(NSString *)msg{
    JohnTopAlert *alert = [[JohnTopAlert alloc]init];
    [alert showAlertMessage:msg alertType:SuccessAlert];
    alert.alertBgColor = [UIColor colorWithHexString:COLR_MAIN];
    [alert alertShow];
}

-(void)showFailedAlert:(NSString *)msg{
    JohnTopAlert *alert = [[JohnTopAlert alloc]init];
    [alert showAlertMessage:msg alertType:FailedAlert];
    alert.alertBgColor = [UIColor colorWithHexString:@"#ff6460"];
    [alert alertShow];
}

-(void)showWarmAlert:(NSString *)msg{
    JohnTopAlert *alert = [[JohnTopAlert alloc]init];
    [alert showAlertMessage:msg alertType:WarmAlert];
    alert.alertBgColor = [UIColor colorWithHexString:@"#E1CD49"];
    [alert alertShow];
}
@end
