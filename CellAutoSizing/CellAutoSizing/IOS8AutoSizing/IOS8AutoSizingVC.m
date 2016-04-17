//
//  IOS8AutoSizingVC.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "IOS8AutoSizingVC.h"
#import "IOS8AutoSizingCell.h"
#import "CellModel.h"

@interface IOS8AutoSizingVC ()
@property (strong, nonatomic) NSArray *cellItemArr;
@end

@implementation IOS8AutoSizingVC

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
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([IOS8AutoSizingCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:IOS8AutoSizingCellID];
    
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellItemArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IOS8AutoSizingCell *cell = [IOS8AutoSizingCell cellWithTableView:tableView];
    cell.cellM = [self.cellItemArr objectAtIndex:indexPath.row];
    return cell;
}



@end
