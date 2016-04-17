//
//  ModelAutoSizingCell.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "ModelAutoSizingCell.h"

@interface ModelAutoSizingCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end

@implementation ModelAutoSizingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    ModelAutoSizingCell *cell = [tableView dequeueReusableCellWithIdentifier:ModelAutoSizingCellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ModelAutoSizingCell" owner:nil options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)setModelAutoSizingModel:(ModelAutoSizingModel *)modelAutoSizingModel
{
    _modelAutoSizingModel = modelAutoSizingModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:modelAutoSizingModel.img] placeholderImage:nil];
    self.contentLabel.text = modelAutoSizingModel.content;
}

@end
