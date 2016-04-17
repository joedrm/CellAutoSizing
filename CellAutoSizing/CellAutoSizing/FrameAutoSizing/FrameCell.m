//
//  FrameCell.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "FrameCell.h"
#import "CellModel.h"

@interface FrameCell ()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation FrameCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"FrameCell";
    FrameCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FrameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.numberOfLines = 0;
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
    }
    return self;
}

- (void)setFrameFM:(FrameFModel *)frameFM
{
    _frameFM = frameFM;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:frameFM.frameCellM.img] placeholderImage:nil];
    self.iconView.frame = frameFM.iconViewF;
    
    self.contentLabel.text = frameFM.frameCellM.content;
    self.contentLabel.frame = frameFM.contentF;
}

@end
