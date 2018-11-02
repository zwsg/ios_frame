//___HEADERFILE___
/*
 * zwsg_frame 
 * BaseFormViewController.m 
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

#import "BaseFormViewController.h"
#import "BaseFormTableViewCell.h"

@interface BaseFormViewController ()

@end

@implementation BaseFormViewController
@synthesize cells;

-(instancetype)init{
    self=[super init];
    if(self){
        self.cells=[NSMutableArray array];
        [self setEnableRefresh:NO];
        [self setEnableLoadMore:NO];
    }
    return self;
}
- (void)submitWithUrl:(NSString *)url withExtParm:(NSMutableDictionary*)extParm withShowTips:(NSString*)tips withResultBlock:(ResultOk)block
{
    self.resultOkBlock=block;
    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    for (NSArray* rows in self.cells)
    {
        for (BaseFormTableViewCell* cell in rows)
        {
            NSString* key = [cell key];
            NSString* value = [cell cellValue];
            NSString* keyboardType = [cell keyboardType];
            NSString *title = [cell title];
            NSString *placeHolder = [cell placeHolder];
            
            if (cell.isRequire)
            {
                if ([cell.valueView isKindOfClass:[UITextField class]]||[cell.valueView isKindOfClass:[UITextView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请输入%@",title]];
                        }else{
                            [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        }
                        return;
                    }
                    else
                    {
                        //类型验证
                        if (![self verifyStr:keyboardType value:value title:title]) {
                            return;
                        }
                    }
                }
                //选择
                if ([cell.valueView isKindOfClass:[UILabel class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value]&&![extParm.allKeys containsObject:key])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请选择%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
                //图片
                if ([cell.valueView isKindOfClass:[UIImageView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value]&&![extParm.allKeys containsObject:key])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
                //单张图片
                if ([cell.valueView isKindOfClass:[UIButton class]] && [ZWStringUtil isNullOrEmpty:value])
                {
                    if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                        [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                        return;
                    }
                    [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                    return;
                }
                //附件
                if ([cell.valueView isKindOfClass:[UICollectionView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
            }
            
            
            if (![ZWStringUtil isNullOrEmpty:key])
            {
                if ([key isEqualToString:@"File"]) {
                    [parm setObject:[ZWJsonUtil jsonToArray:value] forKey:key];
                }else{
                    [parm setObject:value forKey:key];
                }
            }
        }
    }
    if(extParm&&extParm.allKeys.count>0)
    {
        [parm setValuesForKeysWithDictionary:extParm];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"parm=%@",parm]);
//    [ZWHttpUtil Post:url widthParm:parm widthSuccess:^(NSObject *result) {
//        if (![StringUtil isNUllOrEmpty:tips])
//        {
//            [[MsgUtil getInsteance] showSuccess:tips];
//        }
//
//        if(self.resultOkBlock)
//        {
//            NSDictionary *dic = (NSDictionary *)result;
//            self.resultOkBlock([dic mutableCopy]);
//        }
//    } withFaild:^(NSString *faild) {
//
//    } widthEnd:^(NSString *end) {
//
//    }];
}

//提交数据 带弹出框
- (void)submitWithUrl:(NSString *)url withAlertTitle:(NSString *)title withAlertMsg:(NSString *)msg withExtParm:(NSMutableDictionary*)extParm withShowTips:(NSString*)tips withResultBlock:(ResultOk)block
{
    self.resultOkBlock=block;
    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    for (NSArray* rows in self.cells)
    {
        for (BaseFormTableViewCell* cell in rows)
        {
            NSString* key = [cell key];
            NSString* value = [cell cellValue];
            NSString* keyboardType = [cell keyboardType];
            NSString *title = [cell title];
            NSString *placeHolder = [cell placeHolder];
            
            if (cell.isRequire)
            {
                if ([cell.valueView isKindOfClass:[UITextField class]]||[cell.valueView isKindOfClass:[UITextView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请输入%@",title]];
                        }else{
                            [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        }
                        return;
                    }
                    else
                    {
                        //类型验证
                        if (![self verifyStr:keyboardType value:value title:title]) {
                            return;
                        }
                    }
                }
                //选择
                if ([cell.valueView isKindOfClass:[UILabel class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value]&&![extParm.allKeys containsObject:key])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请选择%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
                //图片
                if ([cell.valueView isKindOfClass:[UIImageView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value]&&![extParm.allKeys containsObject:key])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
                //单张图片
                if ([cell.valueView isKindOfClass:[UIButton class]] && [ZWStringUtil isNullOrEmpty:value])
                {
                    if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                        [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                        return;
                    }
                    [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                    return;
                }
                //附件
                if ([cell.valueView isKindOfClass:[UICollectionView class]])
                {
                    if ([ZWStringUtil isNullOrEmpty:value])
                    {
                        if ([ZWStringUtil isNullOrEmpty:placeHolder]) {
                            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"请上传%@",title]];
                            return;
                        }
                        [[ZWTipsUtil sharedUtil] showWarm:placeHolder];
                        return;
                    }
                }
            }
            
            
            if (![ZWStringUtil isNullOrEmpty:key])
            {
                if ([key isEqualToString:@"File"]) {
                    [parm setObject:[ZWJsonUtil jsonToArray:value] forKey:key];
                }else{
                    [parm setObject:value forKey:key];
                }
            }
        }
    }
    if(extParm&&extParm.allKeys.count>0)
    {
        [parm setValuesForKeysWithDictionary:extParm];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"parm=%@",parm]);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        [HttpUtil Post:url widthParm:parm widthSuccess:^(NSObject *result) {
//
//            if (![StringUtil isNUllOrEmpty:tips])
//            {
//                [[MsgUtil getInsteance] showSuccess:tips];
//            }
//
//            if(self.resultOkBlock)
//            {
//                self.resultOkBlock(parm);
//            }
//
//        } widthEnd:^(NSString *end) {
//
//        }];
    }];
    [alertController addAction:cancleAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(BOOL)verifyStr:(NSString*)keyboardType value:(NSString*)value title:(NSString*)title{
    if ([keyboardType isEqualToString:@"IDNum"])
    {
        if (![ZWStringUtil isIDCardNum:value])
        {
            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"%@格式不正确",title]];
            return NO;
        }
    }
    else if ([keyboardType isEqualToString:@"Phone"])//手机号
    {
        if (![ZWStringUtil isMobile:value])
        {
            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"%@格式不正确",title]];
            return NO;
        }
    }
    else if ([keyboardType isEqualToString:@"Tel"])//电话
    {
        if (![ZWStringUtil isTel:value])
        {
            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"%@格式不正确",title]];
            return NO;
        }
    }
    else if ([keyboardType isEqualToString:@"PhoneTel"])
    {
        if (![ZWStringUtil isMobile:value] && ![ZWStringUtil isTel:value])
        {
            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"%@格式不正确",title]];
            return NO;
        }
    }
    else if ([keyboardType isEqualToString:@"CarNum"])
    {
        if (![ZWStringUtil isCarNum:value])
        {
            [[ZWTipsUtil sharedUtil] showWarm:[NSString stringWithFormat:@"%@格式不正确",title]];
            return NO;
        }
    }
    return YES;
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.cells count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSMutableArray* rows=(NSMutableArray*)self.cells[section];
    return rows.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cells[indexPath.section][indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 0;
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((BaseFormTableViewCell*)self.cells[indexPath.section][indexPath.row]).cellHeigh;
}
@end
