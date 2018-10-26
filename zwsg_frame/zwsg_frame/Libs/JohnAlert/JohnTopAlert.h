//
//  JohnTopAlert.h
//  顶部提示框
//
//  Created by YuanQuanTech on 2016/11/11.
//  Copyright © 2016年 John Lai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WarmAlert  = 2,  //警告
    SuccessAlert  = 1,  //成功
    FailedAlert   = 0,  //失败
} MessageType;
@interface JohnTopAlert : UIView

//提示框背景颜色，默认颜色3691D1  232，78，64
@property (nonatomic,weak) UIColor *alertBgColor;

//提示框显示时间，默认2.5s
@property (nonatomic,assign) CGFloat alertShowTime;

- (void)showAlertMessage:(NSString *)msg alertType:(MessageType)type;

- (void)alertShow;

@end
