//
//  FrameFModel.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import "FrameFModel.h"

@implementation FrameFModel


- (void)setFrameCellM:(CellModel *)frameCellM
{
    _frameCellM = frameCellM;
    
    CGFloat padding = 10;
    
    CGFloat iconViewWH = 50;
    CGFloat iconViewX = padding;
    CGFloat iconViewY = padding;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    
    
    CGFloat contentLabelX = CGRectGetMaxX(_iconViewF) + padding;
    CGFloat contentLabelY = padding;
    CGFloat contentLabelMaxW = [UIScreen mainScreen].bounds.size.width - contentLabelX - padding;
    CGSize contentLabelSize = multilineTextSize(frameCellM.content, [UIFont systemFontOfSize:15], CGSizeMake(contentLabelMaxW, MAXFLOAT));
    _contentF = CGRectMake(contentLabelX, contentLabelY, contentLabelSize.width, contentLabelSize.height);
    
    CGFloat maxY = MAX(CGRectGetMaxY(_contentF), CGRectGetMaxY(_iconViewF));
    _cellHeight = maxY + padding;
}

@end
