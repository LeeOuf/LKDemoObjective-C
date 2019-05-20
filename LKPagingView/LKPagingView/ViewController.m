//
//  ViewController.m
//  LKPagingView
//
//  Created by Li,Ke on 2019/5/20.
//  Copyright © 2019年 Li,Ke. All rights reserved.
//

#import "ViewController.h"
#import "LKPagingView.h"
#import "UIView+Extension.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) LKPagingView *pagingView;
@property (nonatomic, strong) UIView *pageHeaderView;
@property (nonatomic, strong) UITableView *tableViewA;
@property (nonatomic, strong) UITableView *tableViewB;
@property (nonatomic, strong) UITableView *tableViewC;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"LKPagingViewDemo";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.pageHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 150.f)];
    self.pageHeaderView.backgroundColor = [UIColor greenColor];
    
    self.tableViewA = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableViewA.dataSource = self;
    self.tableViewA.delegate = self;
    
    self.tableViewB = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableViewB.dataSource = self;
    self.tableViewB.delegate = self;
    
    self.tableViewC = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableViewC.dataSource = self;
    self.tableViewC.delegate = self;
    
    self.pagingView = [[LKPagingView alloc] initWithFrame:self.view.bounds
                                              scrollViews:@[self.tableViewA, self.tableViewB, self.tableViewC]
                                               headerView:self.pageHeaderView
                                           extraTopHeight:0];    // todo: 兼容刘海屏
    [self.view addSubview:self.pagingView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseableKey = @"";
    UIColor *backgroundColor = [UIColor whiteColor];
    NSString *rowText = @"";
    
    if (tableView == self.tableViewA)
    {
        reuseableKey = @"tableViewA";
        backgroundColor = [UIColor redColor];
        rowText = @"tableViewA";
    }
    else if (tableView == self.tableViewB)
    {
        reuseableKey = @"tableViewB";
        backgroundColor = [UIColor yellowColor];
        rowText = @"tableViewB";
    }
    else
    {
        reuseableKey = @"tableViewC";
        backgroundColor = [UIColor blueColor];
        rowText = @"tableViewC";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableKey];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:reuseableKey];
        cell.backgroundColor = backgroundColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@第%ld行", rowText, indexPath.row];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.pagingView scrollViewsOffsetDidChange:scrollView];
}

@end
