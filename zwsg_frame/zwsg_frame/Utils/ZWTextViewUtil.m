//___HEADERFILE___
/*
 * zwsg_frame 
 * ZWTextViewUtil.m 
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

#import "ZWTextViewUtil.h"

@implementation ZWTextViewUtil
//限制最大输入字数
+ (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
   replacementText:(NSString *)text withMaxCount:(NSInteger)maxCount
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        if (offsetRange.location < maxCount)
        {
            return YES;
        }
        else
        {
            [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
            return NO;
        }
    }
    
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    NSInteger caninputlen = maxCount - comcatstr.length;
    
    if (caninputlen >= 0)
    {
        return YES;
    }
    else
    {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0)
        {
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            }
            else
            {
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          
                                          if (idx >= rg.length) {
                                              *stop = YES; //取出所需要就break，提高效率
                                              return ;
                                          }
                                          
                                          trimString = [trimString stringByAppendingString:substring];
                                          
                                          idx++;
                                      }];
                s = trimString;
            }
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
        return NO;
    }
}

+ (void)textViewDidChange:(UITextView *)textView withMaxCount:(NSInteger)maxCount
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (existTextNum > maxCount)
    {
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
        NSString *s = [nsTextContent substringToIndex:maxCount];
        [textView setText:s];
    }
}


//UITextFieldDelegate   输入限制
+(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string withMaxCount:(NSInteger)maxCount
{
    NSString *toBeString = textField.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; // 键盘输入模式
    if (range.length == 1 && string.length == 0) {
        return YES;
    }
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length >= maxCount) {
                textField.text = [toBeString substringToIndex:maxCount];
                [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
                return NO;
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length >= maxCount) {
            [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
            return NO;
        }
    }
    return YES;
}
//ios10之后 没有这个方法了 自己加的监听方法
+(void)textFieldDidChange :(UITextField *)theTextField withMaxCount:(NSInteger)maxCount
{
    NSString *toBeString = theTextField.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"])
    {
        UITextRange *selectedRange = [theTextField markedTextRange];
        UITextPosition *position = [theTextField positionFromPosition:selectedRange.start offset:0];
        if (!position)
        {
            if (toBeString.length >= maxCount)
            {
                theTextField.text = [toBeString substringToIndex:maxCount];
            }
        }
    }
    else
    {
        if (toBeString.length >= maxCount)
        {
            theTextField.text = [toBeString substringToIndex:maxCount];
        }
    }
}
@end
