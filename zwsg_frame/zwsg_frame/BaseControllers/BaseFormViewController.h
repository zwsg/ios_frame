//___HEADERFILE___
/*
 * zwsg_frame 
 * BaseFormViewController.h 
 * Created by xhb on 2018/10/30. 
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

#import "BaseTableViewController.h"
typedef void (^ResultOk)(NSMutableDictionary* dic);
@interface BaseFormViewController : BaseTableViewController
@property (copy,nonatomic)ResultOk resultOkBlock;
//所有的cell
@property(strong,nonatomic) NSMutableArray* cells;

-(void)submitWithUrl:(NSString *)url withExtParm:(NSMutableDictionary*)extParm withShowTips:(NSString*)tips withResultBlock:(ResultOk)block;

- (void)submitWithUrl:(NSString *)url withAlertTitle:(NSString *)title withAlertMsg:(NSString *)msg withExtParm:(NSMutableDictionary*)extParm withShowTips:(NSString*)tips withResultBlock:(ResultOk)block;
@end
