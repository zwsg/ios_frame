//
//  XLTieBarLoading.h
//  XLTieBarLoadingDemo
//
//  Created by MengXianLiang on 2017/3/7.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLTieBarLoading : UIView
+(instancetype)sharedLoading;
/**
 * 显示方法
 */
-(void)showInView;

/**
 * 隐藏方法
 */
-(void)hideInView;

@end
