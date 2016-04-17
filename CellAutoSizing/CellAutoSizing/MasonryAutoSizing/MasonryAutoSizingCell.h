//
//  MasonryAutoSizingCell.h
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *MasonryAutoSizingCellID = @"MasonryAutoSizingCell";

@class CellModel;
@interface MasonryAutoSizingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CellModel *cellM;

@end
