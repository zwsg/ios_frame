//
//  ViewController.m
//  zwsg_frame
//
//  Created by xhb on 2018/8/28.
//  Copyright © 2018年 ZWSG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.navigationItem.title = @"ios框架";
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 150, 50, 50)];
    [btn setTitle:@"success" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(test1) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(250, 150, 50, 50)];
    [btn1 setTitle:@"warm" forState:(UIControlStateNormal)];
    [btn1 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(test2) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 350, 50, 50)];
    [btn2 setTitle:@"error" forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(test3) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn2];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(250, 350, 50, 50)];
    [btn4 setTitle:@"progress" forState:(UIControlStateNormal)];
    [btn4 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [btn4 addTarget:self action:@selector(test4) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn4];
}
-(void)test1{
    [[ZWTipsUtil sharedUtil] showSuccess:@"成功！"];
}
-(void)test2{
    [[ZWTipsUtil sharedUtil] showWarm:@"警告！"];
}
-(void)test3{
    [[ZWTipsUtil sharedUtil] showError:@"失败！"];
}
-(void)test4{
    [[ZWTipsUtil sharedUtil] showProgress];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(dismissLoading) userInfo:nil repeats:NO];
}
-(void)dismissLoading{
     [[ZWTipsUtil sharedUtil] dismiss];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
