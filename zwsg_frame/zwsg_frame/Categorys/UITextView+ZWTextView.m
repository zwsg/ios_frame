//___HEADERFILE___
/*
 * zwsg_frame 
 * UITextView+ZWTextView.m 
 * Created by xhb on 2018/11/5. 
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

#import "UITextView+ZWTextView.h"
#import <objc/runtime.h>
static const char placeholderKey = '\3';
static const char placeholderColorKey = '\4';
static const char placeholderLabelKey = '\5';
static const char maxInputLengthKey = '\6';
static UILabel *placeholderLabel;
@interface UITextView ()<UITextViewDelegate>

@end
@implementation UITextView (ZWTextView)

+ (void)load{
    Method initWithFrame = class_getInstanceMethod(self, NSSelectorFromString(@"initWithFrame:"));
    Method zw_initWithFrame = class_getInstanceMethod(self, @selector(zw_initWithFrame:));
    method_exchangeImplementations(initWithFrame, zw_initWithFrame);
    
    Method drawRect = class_getInstanceMethod(self, NSSelectorFromString(@"drawRect:"));
    Method zw_drawRect = class_getInstanceMethod(self, @selector(zw_drawRect:));
    method_exchangeImplementations(drawRect, zw_drawRect);
    
    Method setText = class_getInstanceMethod(self, NSSelectorFromString(@"setText:"));
    Method zw_setText = class_getInstanceMethod(self, @selector(zw_setText:));
    method_exchangeImplementations(setText, zw_setText);
    
    Method setFont = class_getInstanceMethod(self, NSSelectorFromString(@"setFont:"));
    Method zw_setFont = class_getInstanceMethod(self, @selector(zw_setFont:));
    method_exchangeImplementations(setFont, zw_setFont);
    
    Method setAttributedText = class_getInstanceMethod(self, NSSelectorFromString(@"setAttributedText:"));
    Method zw_setAttributedText = class_getInstanceMethod(self, @selector(zw_setAttributedText:));
    method_exchangeImplementations(setAttributedText, zw_setAttributedText);
}
-(void)drawRect:(CGRect)rect{
    
}
- (void)zw_drawRect:(CGRect)rect{    
    if (self.hasText) {
        return;
    }
    /**
     placeholder文字的绘制情况跟自身的text 属性相关，
     所以要重写set方法去调用drawRect方法（setNeedsDisplay）
     **/
    rect.origin.x = 5;
    rect.origin.y = 8;
    rect.size.width -= 2 * rect.origin.x;
    if (self.placeholderAttributes) {
        [self.placeholder drawInRect:rect withAttributes:self.placeholderAttributes];
    }else{
        [self.placeholder drawInRect:rect withAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:COLR_PLACEHOLDER],NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE_DEFAULT]}];
    }
}
- (instancetype)zw_initWithFrame:(CGRect)frame{
    [self zw_initWithFrame:frame];
    self.delegate = self;
    return self;
}
- (void)setPlacehoderLabel:(UILabel *)placehoderLabel{
    objc_setAssociatedObject(self, &placeholderLabelKey, placehoderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (void)setPlaceholder:(NSString *)placeholder{
    
    objc_setAssociatedObject(self, &placeholderKey, placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsDisplay];
}
- (void)setPlaceholderAttributes:(NSDictionary *)placeholderAttributes{
    objc_setAssociatedObject(self, &placeholderColorKey, placeholderAttributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsDisplay];
}
- (void)setMaxInputLength:(NSInteger)maxInputLength{
    objc_setAssociatedObject(self, &maxInputLengthKey, @(maxInputLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSInteger)maxInputLength{
    NSNumber *inputNumber = objc_getAssociatedObject(self, &maxInputLengthKey);
    return inputNumber.integerValue;
}
- (NSString *)placeholder{
    return objc_getAssociatedObject(self, &placeholderKey);
}
- (NSDictionary *)placeholderAttributes{
    return objc_getAssociatedObject(self, &placeholderColorKey);
}
- (UILabel *)placehoderLabel{
    return objc_getAssociatedObject(self, &placeholderLabelKey);
}
- (void)zw_setText:(NSString *)text{
    [self zw_setText:text];
    [self setNeedsDisplay];
}
- (void)zw_setAttributedText:(NSAttributedString *)attributedText{
    [self zw_setAttributedText:attributedText];
    [self setNeedsDisplay];
}
- (void)zw_setFont:(UIFont *)font{
    [self zw_setFont:font];
    [self setNeedsDisplay];
}


//限制最大输入字数
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    [self setNeedsDisplay];
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        if (offsetRange.location < self.maxInputLength)
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
    
    NSInteger caninputlen = self.maxInputLength - comcatstr.length;
    
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

- (void)textViewDidChange:(UITextView *)textView
{
    [self setNeedsDisplay];
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (existTextNum > self.maxInputLength)
    {
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        [[ZWTipsUtil sharedUtil] showWarm:@"输入字数达到上限"];
        NSString *s = [nsTextContent substringToIndex:self.maxInputLength];
        [textView setText:s];
    }
}
@end
