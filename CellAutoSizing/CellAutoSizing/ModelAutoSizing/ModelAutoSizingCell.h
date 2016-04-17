//
//  ModelAutoSizingCell.h
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAutoSizingModel.h"

static NSString* ModelAutoSizingCellID = @"ModelAutoSizingCellID";


@class ModelAutoSizingModel;
@interface ModelAutoSizingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelAutoSizingModel *modelAutoSizingModel;
@end
