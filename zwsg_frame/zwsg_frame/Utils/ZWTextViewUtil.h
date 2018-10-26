//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWTextViewUtil.h 
 * Created by xhb on 2018/10/26. 
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

@interface ZWTextViewUtil : NSObject
//textView最大输入字数限制
+ (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
   replacementText:(NSString *)text withMaxCount:(NSInteger)maxCount;

+ (void)textViewDidChange:(UITextView *)textView withMaxCount:(NSInteger)maxCount;

//textField最大输入字数限制
+(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string withMaxCount:(NSInteger)maxCount;
//ios10之后 没有这个方法了 自己加监听方法[textField addTarget:self action:@selector(textViewDidChange:) forControlEvents:UIControlEventEditingChanged];
+(void)textFieldDidChange :(UITextField *)theTextField withMaxCount:(NSInteger)maxCount;
@end
