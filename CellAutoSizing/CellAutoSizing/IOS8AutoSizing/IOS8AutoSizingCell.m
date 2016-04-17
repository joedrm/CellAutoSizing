//
//  IOS8AutoSizingCell.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "IOS8AutoSizingCell.h"

@interface IOS8AutoSizingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation IOS8AutoSizingCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    IOS8AutoSizingCell *cell = [tableView dequeueReusableCellWithIdentifier:IOS8AutoSizingCellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"IOS8AutoSizingCell" owner:nil options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setCellM:(CellModel *)cellM
{
    _cellM = cellM;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:cellM.img] placeholderImage:nil];
    self.contentLabel.text = cellM.content;
}


@end
