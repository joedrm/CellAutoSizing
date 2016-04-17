//
//  MasonryAutoSizingVC.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "MasonryAutoSizingVC.h"
#import "CellModel.h"
#import "MasonryAutoSizingCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface MasonryAutoSizingVC ()
@property (strong, nonatomic) NSArray *cellItemArr;
@end

@implementation MasonryAutoSizingVC

- (NSArray *)cellItemArr
{
    if (_cellItemArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *frameCellMArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            
            CellModel *cellM = [CellModel objectWithKeyValues:dict];
            [frameCellMArray addObject:cellM];
        }
        _cellItemArr = frameCellMArray;
    }
    return _cellItemArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MasonryAutoSizingCell class] forCellReuseIdentifier:MasonryAutoSizingCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellItemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MasonryAutoSizingCell* cell = [MasonryAutoSizingCell cellWithTableView:tableView];
    cell.cellM = [self.cellItemArr objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = [tableView fd_heightForCellWithIdentifier: NSStringFromClass([MasonryAutoSizingCell class]) cacheByIndexPath:indexPath configuration:^(MasonryAutoSizingCell * cell) {
        CellModel * model = [self.cellItemArr objectAtIndex: indexPath.row];
        
        cell.cellM = model;
    }];
    
    return height;
}

@end
