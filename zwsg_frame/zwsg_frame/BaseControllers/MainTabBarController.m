//___HEADERFILE___
/*
 * zwsg_frame 
 * MainTabBarController.m 
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

#import "MainTabBarController.h"
#import "ViewController.h"
#import "TestTableViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)init{
    self=[super init];
    if(self){
        [self initTabbar];
    }
    return self;
    
}

-(void)initTabbar{
    NSArray* tabs=@[
                    @{@"title":@"功能",@"icon":@"tab_1",@"controller":[[ViewController alloc]init]},
                    @{@"title":@"消息",@"icon":@"tab_2",@"controller":[[TestTableViewController alloc]init]},
                    @{@"title":@"播报",@"icon":@"tab_3",@"controller":[[ViewController alloc]init]},
                    @{@"title":@"我的",@"icon":@"tab_4",@"controller":[[ViewController alloc]init]}
                    ];
    NSMutableArray* tabController=[NSMutableArray array];
    for (NSDictionary* item in tabs) {
        UIViewController* tab= (UIViewController*)item[@"controller"];
        [tabController addObject:tab];
        tab.tabBarItem.title=item[@"title"];
        tab.tabBarItem.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",item[@"icon"]]];
        tab.tabBarItem.selectedImage=[[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel.png",item[@"icon"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:COLR_MAIN],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:14.0f],NSFontAttributeName,nil]forState:UIControlStateSelected];
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setBarTintColor:[UIColor whiteColor]];
    tabBar.translucent = NO;
    
    [tabBar setBackgroundImage:[UIImage new]];
    [tabBar setShadowImage:[UIImage new]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    self.tabBar.layer.shadowColor = [UIColor grayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -0.5);
    self.tabBar.layer.shadowOpacity = 0.3;
    self.tabBar.clipsToBounds = NO;
    
    self.viewControllers=tabController;
}
@end
