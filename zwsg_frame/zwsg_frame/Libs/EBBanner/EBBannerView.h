//
//  EBBannerView.h
//  iOS-Foreground-Push-Notification
//
//  Created by pikacode@qq.com on 16/7/21.
//  Copyright © 2016年 57380422@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    EBBannerViewStyleiOS9 = 9,
    EBBannerViewStyleiOS10 = 10,
    EBBannerViewStyleiOS11 = 11
} EBBannerViewStyle;

@protocol EBCustomBannerViewProtocol;
@class EBCustomBannerView, EBBannerViewMaker;
typedef void (^callBackBlock)(void);
@interface EBBannerView : UIView

//show system version style with default values
+(void)showWithContent:(NSString*)content;

//get a specific style banner, customize values below, then call 'show'
+(instancetype)bannerWithBlock:(void(^)(EBBannerViewMaker *make))block;
-(void)show;

// next version to do:
//release shared banner
+(void)clearMemoryForStyle:(EBBannerViewStyle)style;
+(void)clearMemories;
@property(nonatomic,copy)callBackBlock cblock;
@end

@interface EBBannerViewMaker : NSObject

@property(nonatomic, assign)EBBannerViewStyle style;//default is UIDevice.currentDevice.systemVersion.intValue
@property(nonatomic, strong)UIImage  *icon;//default is app icon
@property(nonatomic, strong)NSString *title;//default is app name
@property(nonatomic, strong)NSString *date;//default is "now" = "现在"
@property(nonatomic, strong)NSString *content;
@property(nonatomic, assign)NSTimeInterval animationDuration;//default is 0.3
@property(nonatomic, assign)NSTimeInterval stayDuration;//default is 4.0
@property(nonatomic, strong)id object;//default is content
@property(nonatomic, assign)UInt32 soundID;//default is 1312
@property(nonatomic, strong)NSString *soundName;
@property(nonatomic, assign)BOOL vibrateOnMute;//default is YES


// next version to do
/*
 coverLastOnes:
    YES: new banner will cover last ones by animation
    NO:  new banner will instead last one, which will disappear immediately
 
    e.g.
                         set 'NO'                     set 'YES'
    show:"aaa"      [banner_A "aaa"](shared)      [banner_A "aaa"](shared)
    show:"bbb"      [banner_A "bbb"]              [banner_B "bbb"]
    show:"ccc"      [banner_A "ccc"]              [banner_C "ccc"] or [banner_A "ccc"](if A is hidden)
                                                  B will be released after hidding
 
    show:"ddd"      [banner_A "ddd"]              [banner_D "ddd"] or [banner_A "ddd"] (if A is hidden)
                                                  B,C will be released after hidding
 */
@property(nonatomic, assign)BOOL coverLastOnes;//default is NO

@end

//add observer for this notification to handle tap event and get the 'object' above
extern NSString *const EBBannerViewDidClickNotification;//监听点击弹窗的事件

 
