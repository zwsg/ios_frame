//___HEADERFILE___
/*
 * zwsg_frame 
 * TestFormViewController.m 
 * Created by xhb on 2018/10/31. 
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

#import "TestFormViewController.h"
#import "TextFieldCell.h"
#import "TextViewCell.h"
#import "SelectCell.h"
#import "WSDatePickerView.h"
@interface TestFormViewController ()

@end

@implementation TestFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setForm];
}
-(void)setForm{
    NSMutableArray *sec1Arr = [NSMutableArray array];
    [sec1Arr addObject:[[TextFieldCell alloc] initTitle:@"测试textField" value:@"18355161328" key:@"tf" isRequire:YES placeHolder:@"测试placeHolder" length:11 keyboardType:@"Phone"]];
    [sec1Arr addObject:[[TextViewCell alloc] initTitle:@"测试textView" key:@"tv"]];
    [sec1Arr addObject:[[[SelectCell alloc] initTitle:@"测试selectCell" value:@"二道湾的无多翁多翁多翁多翁多翁多翁多翁的无多翁多无多翁的无多翁多dwdwdwcswcdscsdcdscdscds" key:@"select" cellValue:@"123456"] setClick:^(BaseFormTableViewCell *cell, UIView *valueView) {
        UILabel *lblValue = (UILabel*)valueView;
        WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
            NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
            lblValue.text = dateString;
            cell.cellValue = [ZWTimeUtil timeToTimeStamp:dateString withFormat:@"yyyy-MM-dd HH:mm"];
        }];
        [datepicker show];
    }]];
    [self.cells addObject:sec1Arr];
    [self setFootV];
    [self.tableView reloadData];
}
-(void)setFootV{
    UIView *footV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
    footV.backgroundColor = [UIColor whiteColor];
    
    UIButton *submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, screenWidth-20, 40)];
    submitBtn.layer.masksToBounds = YES;
    submitBtn.layer.cornerRadius = 20;
    submitBtn.backgroundColor = [UIColor colorWithHexString:COLR_MAIN];
    [submitBtn setTitle:@"提交" forState:(UIControlStateNormal)];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:(UIControlEventTouchUpInside)];
    [footV addSubview:submitBtn];
    
    self.tableView.tableFooterView = footV;
}
-(void)submit{
    [self submitWithUrl:@"" withExtParm:nil withShowTips:@"提交成功!" withResultBlock:^(NSMutableDictionary *dic) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
