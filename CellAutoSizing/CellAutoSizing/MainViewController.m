//
//  MainViewController.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#import "MainViewController.h"
#import "FrameAutoSizingVC.h"
#import "MasonryAutoSizingVC.h"
#import "IOS8AutoSizingVC.h"
#import "ModelAutoSizingVC.h"

static NSString* const cellIdentifier = @"MainViewControllerCell";

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* myTableView;
@property (nonatomic, strong) NSArray *titleArr;
@end

@implementation MainViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _myTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _myTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cell不等高的计算";
    [self.view addSubview:self.myTableView];
    _titleArr = @[@"frame计算不等高cell",
                  @"Masonry结合UITableView+FDTemplateLayoutCell计算不等高cell",
                  @"IOS8.0之后不等高cell的计算",
                  @"数据模型提供cellHeight来计算不等高cell"];
}


#pragma mark - TableView dataSource and delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [_titleArr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController* vc;
    switch (indexPath.row) {
        case 0:
            vc = [[FrameAutoSizingVC alloc] init];
            break;
        case 1:
            vc = [[MasonryAutoSizingVC alloc] init];
            break;
        case 2:
            vc = [[IOS8AutoSizingVC alloc] init];
            break;
        case 3:
            vc = [[ModelAutoSizingVC alloc] init];
            break;
        default:
            break;
    }
    vc.title = [_titleArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
