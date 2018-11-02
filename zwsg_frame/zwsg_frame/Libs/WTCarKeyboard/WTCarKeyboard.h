/**
 * 备注:pspsp WTCarKeyboard.h
 * 作者:欧蒙   Copyright © 2017年 egojit. All rights reserved.
 * 日期:2017/5/16
 * 
 *                             _ooOoo_
 *                            o8888888o
 *                            88" . "88
 *                            (| -_- |)
 *                            O\  =  /O
 *                         ____/`---'\____
 *                       .'  \\|     |//  `.
 *                      /  \\|||  :  |||//  \
 *                     /  _||||| -:- |||||-  \
 *                     |   | \\\  -  /// |   |
 *                     | \_|  ''\---/''  |   |
 *                     \  .-\__  `-`  ___/-. /
 *                   ___`. .'  /--.--\  `. . __
 *                ."" '<  `.___\_<|>_/___.'  >'"".
 *               | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *               \  \ `-.   \_ __\ /__ _/   .-` /  /
 *          ======`-.____`-.___\_____/___.-`____.-'======
 *                             `=---='
 *          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 *                     佛祖保佑        永无BUG
 *            佛曰:
 *                   写字楼里写字间，写字间里程序员；
 *                   程序人员写程序，又拿程序换酒钱。
 *                   酒醒只在网上坐，酒醉还来网下眠；
 *                   酒醉酒醒日复日，网上网下年复年。
 *                   但愿老死电脑间，不愿鞠躬老板前；
 *                   奔驰宝马贵者趣，公交自行程序员。
 *                   别人笑我忒疯癫，我笑自己命太贱；
 *                   不见满街漂亮妹，哪个归得程序员？
*/

#import <UIKit/UIKit.h>
#import "WTCarKeyboardModel.h"
@class WTCarKeyboard;

@protocol WTCarKeyboardDelegate <NSObject>

@optional
/** 输入文字改变代理 */
- (void)carKeyboard:(WTCarKeyboard* )carKeyboard didChangeWithText:(NSString* )textStr;

@end

@interface WTCarKeyboard : UIView

/** WTCarKeyboard代理 */
@property (nonatomic,weak)id <WTCarKeyboardDelegate>delegate;

/** 键盘输入block(使用代理方法则不执行block) */
@property (nonatomic,copy)void(^inputBlock)(NSString* textStr);

@end
