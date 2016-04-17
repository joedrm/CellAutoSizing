//
//  MasonryAutoSizingCell.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "MasonryAutoSizingCell.h"
#import "CellModel.h"

@interface MasonryAutoSizingCell ()
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation MasonryAutoSizingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    MasonryAutoSizingCell *cell = [tableView dequeueReusableCellWithIdentifier:MasonryAutoSizingCellID];
    if (cell == nil) {
        cell = [[MasonryAutoSizingCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:MasonryAutoSizingCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    CGFloat padding     = 10;
    CGFloat iconViewWH  = 50;
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(padding);
        make.size.mas_equalTo(CGSizeMake(iconViewWH, iconViewWH));
        make.bottom.mas_lessThanOrEqualTo(-padding).priorityHigh();
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(padding);
        make.top.equalTo(self.iconView);
        make.right.mas_equalTo(-padding);
        make.bottom.mas_equalTo(-padding);
    }];
}

- (void)setCellM:(CellModel *)cellM
{
    _cellM = cellM;
    
    [self.iconView sd_setImageWithURL: [NSURL URLWithString: cellM.img]];
    self.contentLabel.text = cellM.content;
}

@end
