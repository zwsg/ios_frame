//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWUploadFileUtil.h 
 * Created by xhb on 2018/10/29. 
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

#import <Foundation/Foundation.h>
@class BaseViewController;
@interface ZWUploadFileUtil : NSObject
+ (ZWUploadFileUtil *)shared;

/*!
 * @brief 选择图片或者拍照或录视频完成选择使用拍照的图片后，会调用此block
 * @param fileStr 选择的图片或者拍照后选择使用的图片和视频
 */
typedef void (^ZWFileCompelitionBlock)(NSString *fileStr);
/*!
 * @brief 此方法为调起选择图片或者拍照的入口，当选择图片或者拍照后选择使用图片后，回调completion，
 * @param fromController 用于呈现UIImagePickerController的控制器
 * @param completion 当选择图片或者拍照后选择使用图片后，回调completion
 */

//lookPath为nil则只能上传，不支持查看图片，反之既能上传也能查看

//上传照片和视频
- (void)uploadPicAndVideoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion;
//上传照片，包括选择图片和拍照
- (void)uploadPicWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion;
//上传视频
- (void)uploadVideoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion;
//拍照上传
- (void)onlyTakePhotoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion;
@end
