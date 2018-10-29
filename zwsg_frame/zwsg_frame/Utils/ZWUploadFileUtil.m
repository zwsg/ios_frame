//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWUploadFileUtil.m 
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

#import "ZWUploadFileUtil.h"
#import "BaseViewController.h"
#import "ZWFileOptionUtil.h"
#import "ZWFileDetailUtil.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ZWUploadFileUtil()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
{
    NSString *_imagePath;//编辑页传过来的图片
    BOOL _isLook;//是否是查看图片
    NSString *_module;
    UIImagePickerController *selfPicker;
}

@property (nonatomic, weak) BaseViewController *fromController;
@property (nonatomic, copy) ZWFileCompelitionBlock completion;

@end

@implementation ZWUploadFileUtil

+ (ZWUploadFileUtil *)shared
{
    static ZWUploadFileUtil *sharedObject = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!sharedObject) {
            sharedObject = [[[self class] alloc] init];
        }
    });
    return sharedObject;
}

- (void)uploadPicAndVideoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion
{
    self.completion = [completion copy];
    self.fromController = fromController;
    _module = module;
    if ([ZWStringUtil isNullOrEmpty:str]) {
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"相册",@"拍照",@"视频", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"相册",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }else{
        _isLook = YES;
        _imagePath = str;
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"相册",@"拍照",@"视频",@"查看", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"相册",@"查看",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }
}
- (void)uploadPicWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion
{
    self.completion = [completion copy];
    self.fromController = fromController;
    _module = module;
    if ([ZWStringUtil isNullOrEmpty:str]) {
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"相册",@"拍照", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"相册",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }else{
        _isLook = YES;
        _imagePath = str;
        
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"相册",@"拍照",@"查看", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"相册",@"查看",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }
    
}

- (void)uploadVideoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion
{
    self.completion = [completion copy];
    self.fromController = fromController;
    _module = module;
    if ([ZWStringUtil isNullOrEmpty:str]) {
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"视频", nil];
            } else {
                [[ZWTipsUtil sharedUtil] showWarm:@"摄像头访问受限"];
                return ;
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }else{
        _isLook = YES;
        _imagePath = str;
        
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"视频",@"查看", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"查看",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }
}

- (void)onlyTakePhotoWithLookPath:(NSString *)str fromController:(BaseViewController *)fromController withFormName:(NSString *)module completion:(ZWFileCompelitionBlock)completion
{
    self.completion = [completion copy];
    self.fromController = fromController;
    _module = module;
    if ([ZWStringUtil isNullOrEmpty:str]) {
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"拍照", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }else{
        _isLook = YES;
        _imagePath = str;
        
        dispatch_async(kGlobalThread, ^{
            UIActionSheet *actionSheet = nil;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                actionSheet  = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:(id<UIActionSheetDelegate>)self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"拍照",@"查看", nil];
            } else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:(id<UIActionSheetDelegate>)self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"查看",nil];
            }
            
            dispatch_async(kMainThread, ^{
                [actionSheet showInView:fromController.view];
            });
        });
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"相册"]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;//来自相册
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.navigationBar.translucent = NO;
        picker.navigationBar.barTintColor = [UIColor colorWithHexString:COLR_MAIN];
        picker.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        picker.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        picker.navigationBar.tintColor=[UIColor whiteColor];
        // 设置导航默认标题的颜色及字体大小
        picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {
            UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-70, NavBarHeight/2-10, 60, 20)];
            [cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
            [cancelBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
            cancelBtn.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIG];
            [cancelBtn addTarget:self action:@selector(cancelPick) forControlEvents:(UIControlEventTouchUpInside)];
            [picker.navigationBar addSubview:cancelBtn];
        }
        selfPicker = picker;
        [self.fromController presentViewController:picker animated:YES completion:nil];
    }else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"视频"]){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            /// 用户是否允许摄像头使用
            NSString * mediaType = AVMediaTypeVideo;
            AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
            /// 不允许弹出提示框
            if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
                [[ZWTipsUtil sharedUtil] showError:@"摄像头访问受限"];
                [self.fromController dismissViewControllerAnimated:YES completion:nil];
                
            }else{
                ////这里是摄像头可以使用的处理逻辑
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie, nil];
                picker.videoQuality = UIImagePickerControllerQualityTypeMedium;
                picker.videoMaximumDuration = 20;
                picker.delegate = self;
                picker.navigationBar.translucent = NO;
                picker.navigationBar.barTintColor = [UIColor colorWithHexString:COLR_MAIN];
                picker.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
                picker.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
                picker.navigationBar.tintColor=[UIColor whiteColor];
                // 设置导航默认标题的颜色及字体大小
                picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                             NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
                if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {
                    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-70, NavBarHeight/2-10, 60, 20)];
                    [cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
                    [cancelBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
                    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIG];
                    [cancelBtn addTarget:self action:@selector(cancelPick) forControlEvents:(UIControlEventTouchUpInside)];
                    [picker.navigationBar addSubview:cancelBtn];
                }
                selfPicker = picker;
                [self.fromController presentViewController:picker animated:YES completion:nil];
            }
            
        }
    }else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"拍照"]){
        /// 先判断摄像头硬件是否好用
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            /// 用户是否允许摄像头使用
            NSString * mediaType = AVMediaTypeVideo;
            AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
            /// 不允许弹出提示框
            if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
                [[ZWTipsUtil sharedUtil] showError:@"摄像头访问受限"];
                [self.fromController dismissViewControllerAnimated:YES completion:nil];
                
            }else{
                ////这里是摄像头可以使用的处理逻辑
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
                picker.delegate = self;
                picker.navigationBar.translucent = NO;
                picker.navigationBar.barTintColor = [UIColor colorWithHexString:COLR_MAIN];
                picker.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
                picker.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
                picker.navigationBar.tintColor=[UIColor whiteColor];
                // 设置导航默认标题的颜色及字体大小
                picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                             NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
                if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {
                    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-70, NavBarHeight/2-10, 60, 20)];
                    [cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
                    [cancelBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
                    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIG];
                    [cancelBtn addTarget:self action:@selector(cancelPick) forControlEvents:(UIControlEventTouchUpInside)];
                    [picker.navigationBar addSubview:cancelBtn];
                }
                selfPicker = picker;
                [self.fromController presentViewController:picker animated:YES completion:nil];
            }
        }else{
            [[ZWTipsUtil sharedUtil] showError:@"摄像头不可用"];
        }
    }else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"查看"]){
        [ZWFileDetailUtil fileDetailWithDataArr:@[_imagePath] andIndex:0];
    }
}

-(void)cancelPick{
    [selfPicker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)aPicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [aPicker dismissViewControllerAnimated:YES completion:nil];
    
    __weak typeof(self) weakSelf = self;
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])//静态图像
    {
        __block UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
        if (image && self.completion)
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self.fromController setNeedsStatusBarAppearanceUpdate];
            
            dispatch_async(kGlobalThread, ^{
                dispatch_async(kMainThread, ^{
                    //图片比例压缩的一套方法
                    CGSize size = [ZWFileOptionUtil get_ImageCompressionProportion:image];
                    image = [ZWFileOptionUtil scaleToSize:image size:size];
                    NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
                    [weakSelf uploadImg:imageData withVideo:NO];
                });
            });
        }
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])//视频
    {
        NSURL *sourceUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        NSData *videoData = [[NSData alloc] initWithContentsOfURL:sourceUrl];
        if (videoData.length > 1048576*20) //限制20兆之内
        {
            [[ZWTipsUtil sharedUtil] showError:@"视频文件过大,请重新选择"];
        }
        else
        {
            [self uploadImg:videoData withVideo:YES];
        }
    }
}

#pragma 取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)aPicker {
    [aPicker dismissViewControllerAnimated:YES completion:nil];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.fromController setNeedsStatusBarAppearanceUpdate];
    return;
}

#pragma 上传附件

-(void)uploadImg:(NSData*)imageData withVideo:(BOOL)isVideo
{
//    __weak typeof(self) weakSelf = self;
//    [HttpUtil uploadFile:imageData withVideo:isVideo widthParm:@{@"module":_module} widthSuccess:^(NSObject *result) {
//        NSArray *resultArr = (NSArray *)result;
//        NSDictionary *urlDict = [[NSDictionary alloc] init];
//        NSString *urlStr = @"";
//        if (resultArr!=nil && resultArr.count>0)
//        {
//            urlDict = resultArr[0];
//            urlStr = [urlDict getString:@"path"];
//        }
//        weakSelf.completion(urlStr);
//    } widthEnd:^(NSString *end) {
//
//    }];
}
@end
