//
//  ModelAutoSizingModel.m
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//


#import "ModelAutoSizingModel.h"

@implementation ModelAutoSizingModel

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        
        CGFloat padding = 10;
        
        CGFloat iconViewWH = 50;
        
        CGFloat contentLabelX = iconViewWH + padding * 2;
        CGFloat contentLabelMaxW = [UIScreen mainScreen].bounds.size.width - contentLabelX - padding;
        CGSize contentLabelSize = multilineTextSize(self.content, [UIFont systemFontOfSize:15], CGSizeMake(contentLabelMaxW, MAXFLOAT));
        
        CGFloat maxY = MAX((contentLabelSize.height + padding*2), (iconViewWH+padding*2));
        
        _cellHeight = maxY;
        
    }
    return _cellHeight;
    
}

@end
