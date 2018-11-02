/**
 * 备注:pspsp WTCarKeyboardModel.m
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

#import "WTCarKeyboardModel.h"
@interface WTCarKeyboardModel ()

@end

@implementation WTCarKeyboardModel

- (instancetype)init;
{
    self = [super init];
    if (self)
    {
        _type = [[UIDevice currentDevice] orientation];
        //默认设置
        if (_type == UIDeviceOrientationLandscapeLeft || _type == UIDeviceOrientationLandscapeRight)
        {
            
            [self setDataForLandscape:YES];
            _type = [[UIDevice currentDevice] orientation];
        }
        else if(_type == UIDeviceOrientationPortrait || _type == UIDeviceOrientationPortraitUpsideDown)
        {
            [self setDataForLandscape:NO];
            _type = [[UIDevice currentDevice] orientation];
        }
        else
        {
            [self setDataForLandscape:NO];
            _type = UIDeviceOrientationPortrait;
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

/** 处理函数 */
-(void)orientationChanged;
{
    switch ([[UIDevice currentDevice] orientation])
    {
        case UIDeviceOrientationPortrait:case UIDeviceOrientationPortraitUpsideDown:
        {
            if (_type == UIDeviceOrientationLandscapeLeft || _type == UIDeviceOrientationLandscapeRight || (_type == UIDeviceOrientationPortraitUpsideDown && [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait))
            {
                //设置
                [self setDataForLandscape:NO];
                if ([_delegate respondsToSelector:@selector(orientationDidChangeWithCarKeyboardModel:landscape:)])
                {
                    [_delegate orientationDidChangeWithCarKeyboardModel:self landscape:NO];
                }
            }
            _type = [[UIDevice currentDevice] orientation];
        }
            break;
        case UIDeviceOrientationLandscapeLeft:case UIDeviceOrientationLandscapeRight:
        {
            if (_type != UIDeviceOrientationLandscapeLeft && _type != UIDeviceOrientationLandscapeRight)
            {
                //设置
                [self setDataForLandscape:YES];
                if ([_delegate respondsToSelector:@selector(orientationDidChangeWithCarKeyboardModel:landscape:)])
                {
                    [_delegate orientationDidChangeWithCarKeyboardModel:self landscape:YES];
                }
            }
            _type = [[UIDevice currentDevice] orientation];
        }
            break;
        default:
        {
            ;
        }
            break;
    }
}

/** 设置数据 */
- (void)setDataForLandscape:(BOOL)isLandscape;
{
    //设置
    if (isLandscape)
    {
        _btnWidth = 38.0f;
    }
    else
    {
        if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown)
        {
            _btnWidth = 38.0f;
        }
        else
        {
            _btnWidth = 28.0f;
        }
    }
    _btnHeight = 45.0f;
    _btnHeightSpace = (216-_btnHeight*4)/5.0;
    _btnWidthSpace = (screenWidth-10*_btnWidth)/11.0;
    _viewFrame = CGRectMake(0, 0, screenWidth, 216);
}

- (void)dealloc;
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
