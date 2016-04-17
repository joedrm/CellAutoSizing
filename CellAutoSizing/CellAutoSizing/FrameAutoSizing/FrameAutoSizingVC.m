//
//  FrameAutoSizingVC.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "FrameAutoSizingVC.h"

#import "FrameCell.h"
#import "CellModel.h"
#import "FrameFModel.h"

@interface FrameAutoSizingVC ()
@property (strong, nonatomic) NSArray *cellItemArr;

@end

@implementation FrameAutoSizingVC

- (NSArray *)cellItemArr
{
    if (_cellItemArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *frameCellMArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            
            CellModel *frameCellM = [CellModel objectWithKeyValues:dict];
            FrameFModel* frameFM = [[FrameFModel alloc] init];
            frameFM.frameCellM = frameCellM;
            
            [frameCellMArray addObject:frameFM];
        }
        _cellItemArr = frameCellMArray;
    }
    return _cellItemArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellItemArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FrameCell* cell = [FrameCell cellWithTableView:tableView];
    cell.frameFM = [self.cellItemArr objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FrameFModel* frameFM = [self.cellItemArr objectAtIndex:indexPath.row];
    return frameFM.cellHeight;
}

@end
