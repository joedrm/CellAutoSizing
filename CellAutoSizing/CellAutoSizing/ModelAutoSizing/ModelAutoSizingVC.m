//
//  ModelAutoSizingVC.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "ModelAutoSizingVC.h"
#import "ModelAutoSizingCell.h"
#import "ModelAutoSizingModel.h"

@interface ModelAutoSizingVC ()
@property (strong, nonatomic) NSArray *cellItemArr;
@end

@implementation ModelAutoSizingVC

- (NSArray *)cellItemArr
{
    if (_cellItemArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *frameCellMArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            
            ModelAutoSizingModel *cellM = [ModelAutoSizingModel objectWithKeyValues:dict];
            [frameCellMArray addObject:cellM];
        }
        _cellItemArr = frameCellMArray;
    }
    return _cellItemArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([ModelAutoSizingCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:ModelAutoSizingCellID];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellItemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelAutoSizingCell *cell = [ModelAutoSizingCell cellWithTableView:tableView];
    cell.modelAutoSizingModel = self.cellItemArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelAutoSizingModel *cellM = self.cellItemArr[indexPath.row];
    return cellM.cellHeight;
}

@end
