//___HEADERFILE___
/*
 * zwsg_frame 
 * BaseTableViewController.m 
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

#import "BaseTableViewController.h"
#import "KafkaRefresh.h"
#import "UIScrollView+EmptyDataSet.h"
@interface BaseTableViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, assign) id <RefreshDelegate> refreshDelegate;
@end

@implementation BaseTableViewController

@synthesize tableView;

-(void)setEnableRefresh:(BOOL)enableRefresh{
    _enableRefresh=enableRefresh;
    if (!enableRefresh) {
        self.tableView.headRefreshControl=nil;
    }
}
-(void)setEnableLoadMore:(BOOL)enableLoadMore{
    _enableLoadMore=enableLoadMore;
    if (!enableLoadMore) {
        self.tableView.footRefreshControl=nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    self.tableView.estimatedRowHeight =0;
    self.tableView.estimatedSectionHeaderHeight =0;
    self.tableView.estimatedSectionFooterHeight =0;
    [self.view addSubview: self.tableView];
    //在内容所在的vc设置即可，这样tableView会随着所在的viewController一起调整尺寸
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeNone;//这个也很重要，不然view会被导航栏遮住的
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor colorWithHexString:COLR_BACKGROUND]];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.refreshDelegate=self;
    
    self.tableView.tableFooterView = [UIView new];
    
    //https://github.com/OpenFeyn/KafkaRefresh
    [self.tableView bindHeadRefreshHandler:^{
        [self refreshData];
    } themeColor:[UIColor colorWithHexString:COLR_MAIN] refreshStyle:KafkaRefreshStyleReplicatorWoody];
    [self.tableView bindFootRefreshHandler:^{
        [self loadMoreData];
    } themeColor:[UIColor colorWithHexString:COLR_MAIN] refreshStyle:KafkaRefreshStyleReplicatorWoody];
}

//开始刷新
-(void)beginRefresh
{
    [self.tableView.headRefreshControl beginRefreshing];
}
//停止刷新
-(void)stopRefresh
{
    if (self.tableView.headRefreshControl.isRefresh)
    {
        [self.tableView.headRefreshControl endRefreshing];
    }
    else if (self.tableView.footRefreshControl.isRefresh)
    {
        [self.tableView.footRefreshControl endRefreshing];
    }
}

//下拉刷新数据
-(void)refreshData{
    if (self.refreshDelegate) {
        [self.refreshDelegate pullDownRefresh];
    }
}
//上拉加载更多数据
-(void)loadMoreData{
    if (self.refreshDelegate) {
        [self.refreshDelegate pullUpLoadMore];
    }
}

//https://www.jianshu.com/p/f70dc3e0f436
//空白页图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"lion"];
}
//空白页提示
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"暂无数据";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName:[UIColor darkGrayColor]
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
//空白页描述
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"测试测试测试！";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}
@end
