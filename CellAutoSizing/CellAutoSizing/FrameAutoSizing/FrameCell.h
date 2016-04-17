//
//  FrameCell.h
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrameFModel.h"


@class FrameFModel;
@interface FrameCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) FrameFModel *frameFM;
@end
